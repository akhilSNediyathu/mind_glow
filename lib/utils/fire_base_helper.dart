// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow/view/main_page/Screeen_main.dart';

Future<void> loginUser(
    String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenMain()),
    );
  } catch (e) {
    String errorMessage = "An error occurred during login.";
    if (e is FirebaseAuthException) {
      errorMessage = e.message ?? "An unknown error occurred.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 3),
      ),
    );

    if (kDebugMode) {
      print("Error: $e");
    }
  }
}

// new user
Future<void> registerUser(
    String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ScreenMain()),
    );
  } catch (e) {
    String errorMessage = "An error occurred during registration.";
    if (e is FirebaseAuthException) {
      errorMessage = e.message ?? "An unknown error occurred.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
