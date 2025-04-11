import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vpn_app1/screens/widgets/analytics_title_widget.dart';
import 'package:vpn_app1/util/vpn_provider.dart';

import 'package:sizer/sizer.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Аналитика подключений')),
      body: Center(
        child: Consumer<VPNProvider>(
          builder: (context, vpnProvider, child) {
            final connectionHistory = vpnProvider.connectionHistory;
            if (connectionHistory.isEmpty) {
              return Text(
                "Отсутствие соединение",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              );
            }
            return ListView.builder(
              itemCount: connectionHistory.length,
              itemBuilder: (context, index) {
                final connection = connectionHistory[index];
                final formattedDate = DateFormat(
                  'yyyy-MM-dd – kk:mm',
                ).format(connection.timestamp);
                return AnalyticsTitleWidget(
                  connection: connection,
                  formattedDate: formattedDate,
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
