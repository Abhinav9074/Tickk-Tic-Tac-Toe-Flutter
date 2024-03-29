import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/service/auth_service.dart';
import 'package:tic_tac_toe/utils/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/login.json', height: 360, width: 600),
              const Text(
                'Enter The Realm of Tickk',
                style: MyTextStyle.greyTextMedium,
              )
            ],
          ),
        ),
        ElevatedButton.icon(
            onPressed: () async{
              await AuthService().googleSignIn();
            },
            icon: Image.asset(
              'assets/icons/google.png',
              width: 20,
              height: 20,
            ),
            label: const Text(
              'Continue With Google',
              style: MyTextStyle.googleButton,
            ))
      ],
    ));
  }
}
