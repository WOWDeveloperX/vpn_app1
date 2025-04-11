import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final double size;

  const LoadingWidget({
    super.key,
    this.color = const Color.fromARGB(255, 60, 89, 220),
    this.size = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Center(
        child: SpinKitSpinningLines(color: color, size: size, lineWidth: 10),
      ),
    );
  }
}
