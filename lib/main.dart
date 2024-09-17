import 'package:flutter/material.dart';
import 'package:mind_glow/firebase_options.dart';
import 'package:mind_glow/view/splash/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
