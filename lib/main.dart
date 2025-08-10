import 'package:flairshub/presentation/features/LoginPage.dart';
import 'package:flairshub/presentation/features/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'core/network/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenWrapper(),
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Color(0xFFD13B28),
          brightness: Brightness.light
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
      // Or another screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
