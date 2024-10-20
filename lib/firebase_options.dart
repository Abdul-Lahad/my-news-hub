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
    apiKey: 'AIzaSyA3fxPdw5xUsSVVx-AIO6HYxe2LiXKNFWs',
    appId: '1:464807375453:web:ceba091f674cda0f3bd3b4',
    messagingSenderId: '464807375453',
    projectId: 'my-news-hub',
    authDomain: 'my-news-hub.firebaseapp.com',
    storageBucket: 'my-news-hub.appspot.com',
    measurementId: 'G-3XW8ZP1NEC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBApjH-Awi2_SNXD-X5TKdP9AkxkNpFilY',
    appId: '1:464807375453:android:c9e170751bc689643bd3b4',
    messagingSenderId: '464807375453',
    projectId: 'my-news-hub',
    storageBucket: 'my-news-hub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADfjZqjCTbvDGyTh-FBfH42HQS0HhbTMU',
    appId: '1:464807375453:ios:31cb1ca47b4424823bd3b4',
    messagingSenderId: '464807375453',
    projectId: 'my-news-hub',
    storageBucket: 'my-news-hub.appspot.com',
    iosBundleId: 'com.example.myNewsHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADfjZqjCTbvDGyTh-FBfH42HQS0HhbTMU',
    appId: '1:464807375453:ios:31cb1ca47b4424823bd3b4',
    messagingSenderId: '464807375453',
    projectId: 'my-news-hub',
    storageBucket: 'my-news-hub.appspot.com',
    iosBundleId: 'com.example.myNewsHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA3fxPdw5xUsSVVx-AIO6HYxe2LiXKNFWs',
    appId: '1:464807375453:web:f0dc0c39accbbc153bd3b4',
    messagingSenderId: '464807375453',
    projectId: 'my-news-hub',
    authDomain: 'my-news-hub.firebaseapp.com',
    storageBucket: 'my-news-hub.appspot.com',
    measurementId: 'G-6NRNTLT330',
  );
}