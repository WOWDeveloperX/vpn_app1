import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_app1/constant/app_string.dart';
import 'package:vpn_app1/util/vpn_provider.dart';

class ConnectionButton extends StatelessWidget {
  const ConnectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final vpnProvider = Provider.of<VPNProvider>(context);

    return ElevatedButton(
      onPressed: () async => await vpnProvider.toggleConnection(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        backgroundColor:
            vpnProvider.isConnected
                ? Color.fromARGB(224, 59, 179, 63)
                : Color.fromARGB(187, 239, 83, 80),
      ),
      child: Text(
        vpnProvider.isConnected ? AppString.connected : AppString.disconnected,
        style: TextStyle(
          fontSize: 20.sp,
          color: vpnProvider.isConnected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
