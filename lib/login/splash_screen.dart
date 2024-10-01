import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gutech_llc/login/log_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    // Set the duration of the splash screen
    Timer(Duration(seconds: 3), () {
      // Navigate to the LoginScreen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child:
              Image.asset('logo.png', height: 400, width: 350)),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
