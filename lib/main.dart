import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_app1/constant/theme/custom_theme.dart';
import 'util/vpn_provider.dart';
import 'screens/vpn_screen.dart';
import 'screens/analytics_screen.dart';
import "package:firebase_core/firebase_core.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => VPNProvider(),
          child: MaterialApp(
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.dark,
            title: 'VPN App',
            home: VpnScreen(),
            routes: {'/analytics': (context) => AnalyticsScreen()},
          ),
        );
      },
    );
  }
}
