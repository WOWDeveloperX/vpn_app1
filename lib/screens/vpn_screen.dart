import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_app1/screens/widgets/connection_button.dart';
import 'package:vpn_app1/screens/widgets/loading_widget.dart';
import '../util/vpn_provider.dart';

class VpnScreen extends StatelessWidget {
  const VpnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VPN Connection'),
        actions: [
          IconButton(
            icon: Icon(Icons.analytics_sharp, size: 25.sp),
            onPressed: () => Navigator.pushNamed(context, '/analytics'),
          ),
        ],
      ),
      body: Center(
        child: Consumer<VPNProvider>(
          builder: (context, vpnProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (vpnProvider.isConnected) LoadingWidget(),
                Spacer(),
                SizedBox(height: 2.h),
                Text(
                  "Время: ${vpnProvider.connectionDuration}",
                  style: TextStyle(fontSize: 22.sp),
                ),
                SizedBox(height: 2.h),
                ConnectionButton(),
                SizedBox(height: 10.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
