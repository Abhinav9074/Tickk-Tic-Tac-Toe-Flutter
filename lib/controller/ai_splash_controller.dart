import 'dart:async';
import 'package:get/get.dart';
import 'package:tic_tac_toe/view/screens/vs_ai/vs_ai.dart';


class AiSplashController extends GetxController{

  @override
  void onReady(){
    Timer(const Duration(seconds: 4), () {
     Get.offAll(const VsAi()); 
    });
    super.onReady();
  }
}