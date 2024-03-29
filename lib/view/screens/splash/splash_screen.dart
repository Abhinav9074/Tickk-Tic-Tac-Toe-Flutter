import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController().onReady();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Lottie.asset('assets/lottie/splash.json',width: 200,height: 200),
      )),
    );
  }
}
