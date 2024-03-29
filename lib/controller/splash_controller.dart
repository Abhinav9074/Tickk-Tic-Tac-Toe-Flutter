import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/view/screens/home/home_screen.dart';
import 'package:tic_tac_toe/view/screens/login/login_screen.dart';


class SplashController extends GetxController{

  @override
  void onReady(){
    Timer(const Duration(seconds: 4), () {
      final loggedStatus =  FirebaseAuth.instance.currentUser;
      if(loggedStatus!=null){
        Get.offAll( const HomeScreen());
        Get.snackbar('Logged In As',
          FirebaseAuth.instance.currentUser!.displayName!,
          backgroundColor: Colors.green, colorText: Colors.white);
      }else{
        Get.offAll(const LoginScreen());
      }
    });
    super.onReady();
  }
}