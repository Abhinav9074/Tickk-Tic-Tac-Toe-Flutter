import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/firebase_options.dart';
import 'package:tic_tac_toe/service/initialize_controllers.dart';
import 'package:tic_tac_toe/utils/theme.dart';
import 'package:tic_tac_toe/view/screens/splash/splash_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    log("Firebase Initialized Successfully");
  }).catchError((error) {
    log("Firebase Initialization Error: $error");
  });

  AllControllers().initailizeAllControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'Tic Tac Toe',
      home: const SplashScreen(),
    );
  }
}