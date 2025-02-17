// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mind_glow/utils/colo_extension.dart';
import 'package:mind_glow/view/login/screen_login.dart';
import 'package:mind_glow/view/main_page/Screeen_main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: media.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Tcolo.primaryG,
                begin: Alignment.topCenter,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: .7,
                  child: SizedBox(
                      //     height: media.height * 0.045,
                      //     width: media.width * 0.18,
                      child: Lottie.asset(
                          'assets/images/Animation - 1726307186342.json')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    final check = FirebaseAuth.instance.currentUser;
  //  print(check);
    if (check == null) {
      
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ScreenLogin()));
    } else {
      
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) =>  ScreenMain()));
    }
  }
}
