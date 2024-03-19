import 'package:calendar_scheduler/common/constants/sizes.md';
import 'package:calendar_scheduler/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      await Navigator.pushReplacementNamed(
        context,
        HomeScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
                width: Sizes.size150,
                height: Sizes.size150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
