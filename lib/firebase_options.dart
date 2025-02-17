// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBzf36mdtsPieDx-nFxK0_3je5k9xI3Ggs',
    appId: '1:510672202805:web:be1dc1a6b013682c06557c',
    messagingSenderId: '510672202805',
    projectId: 'mind-glow-d6e40',
    authDomain: 'mind-glow-d6e40.firebaseapp.com',
    storageBucket: 'mind-glow-d6e40.appspot.com',
    measurementId: 'G-3YBS3BWKQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOvgZifjGy9_sbUReLlbkGvG7xi2cYbck',
    appId: '1:510672202805:android:7fdaa26ac84b591206557c',
    messagingSenderId: '510672202805',
    projectId: 'mind-glow-d6e40',
    storageBucket: 'mind-glow-d6e40.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJFA6WfBHMl_tLka8FdsRzWbmIjgzLZoo',
    appId: '1:510672202805:ios:6f81b6d82745972b06557c',
    messagingSenderId: '510672202805',
    projectId: 'mind-glow-d6e40',
    storageBucket: 'mind-glow-d6e40.appspot.com',
    iosBundleId: 'com.example.mindGlow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJFA6WfBHMl_tLka8FdsRzWbmIjgzLZoo',
    appId: '1:510672202805:ios:6f81b6d82745972b06557c',
    messagingSenderId: '510672202805',
    projectId: 'mind-glow-d6e40',
    storageBucket: 'mind-glow-d6e40.appspot.com',
    iosBundleId: 'com.example.mindGlow',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBzf36mdtsPieDx-nFxK0_3je5k9xI3Ggs',
    appId: '1:510672202805:web:6e2f0203238929ef06557c',
    messagingSenderId: '510672202805',
    projectId: 'mind-glow-d6e40',
    authDomain: 'mind-glow-d6e40.firebaseapp.com',
    storageBucket: 'mind-glow-d6e40.appspot.com',
    measurementId: 'G-V31GGGCMWB',
  );

}