import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tic_tac_toe/view/screens/home/home_screen.dart';
import 'package:tic_tac_toe/view/screens/login/login_screen.dart';

class AuthService {
  AuthService.internal();
  static AuthService instance = AuthService.internal();
  factory AuthService() => instance;

  Future<void> googleSignIn() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      Get.snackbar('Authentication Successful',
          'Welcome ${FirebaseAuth.instance.currentUser!.displayName!}',
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAll( const HomeScreen());
    } catch (e) {
      Get.snackbar('Authentication Failed', 'Please Select a Google Account',
          backgroundColor: Colors.red, colorText: Colors.white);
      log('Authentication Error');
      log(e.toString());
    }
  }

  Future<void> signOut()async{
    await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              Get.offAll(const LoginScreen());
  }
}
