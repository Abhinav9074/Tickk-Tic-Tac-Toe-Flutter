import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/controller/ai_splash_controller.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tic_tac_toe/utils/theme.dart';

class AiLoading extends StatelessWidget {
  const AiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    AiSplashController().onReady();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/ai-loading.json'),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Training AI...',
                  textStyle: MyTextStyle.lightText),
            ],
          ),
        ],
      ),
    );
  }
}
