import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Connection {
  final DateTime timestamp;
  final Duration duration;

  Connection(this.timestamp, this.duration);
}

class VPNProvider with ChangeNotifier {
  bool _isConnected = false;
  DateTime? _connectionStartTime;
  final List<Connection> _connectionHistory = [];
  Timer? _timer;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  bool get isConnected => _isConnected;
  List<Connection> get connectionHistory => _connectionHistory;

  String get connectionDuration {
    if (_connectionStartTime == null) return "00:00:00";
    final duration = DateTime.now().difference(_connectionStartTime!);
    return _formatDuration(duration);
  }

  Future<void> toggleConnection() async {
    _isConnected = !_isConnected;
    if (_isConnected) {
      _connectionStartTime = DateTime.now();
      _startTimer();
      await _logConnectionEvent(true);
    } else {
      _handleDisconnection();
      await _logConnectionEvent(false);
    }
    notifyListeners();
  }

  void _handleDisconnection() {
    if (_connectionStartTime != null) {
      final duration = DateTime.now().difference(_connectionStartTime!);
      _connectionHistory.add(Connection(DateTime.now(), duration));
      _connectionStartTime = null;
    }
    _stopTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _logConnectionEvent(bool isConnected) async {
    try {
      await _analytics.logEvent(
        name: isConnected ? 'vpn_connected' : 'vpn_disconnected',
        parameters: <String, Object>{'timestamp': DateTime.now().toString()},
      );
      print(
        'Event logged: ${isConnected ? 'vpn_connected' : 'vpn_disconnected'}',
      );
    } catch (e) {
      print('Error logging event: $e');
    }
  }

  String _formatDuration(Duration duration) {
    return "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
