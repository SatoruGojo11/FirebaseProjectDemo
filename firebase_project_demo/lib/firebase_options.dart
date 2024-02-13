// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAlu0kodG3ySRDrqveFax1QNqqpm-mPh7A',
    appId: '1:343354554227:web:ef94443f1fca2bd758b706',
    messagingSenderId: '343354554227',
    projectId: 'fir-project-demo-5c1a9',
    authDomain: 'fir-project-demo-5c1a9.firebaseapp.com',
    storageBucket: 'fir-project-demo-5c1a9.appspot.com',
    measurementId: 'G-CRXFHGWFLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg-JaT48Sz3-fqkiFp-zjDpeVyWiDnZpo',
    appId: '1:343354554227:android:b479e08b75be84c658b706',
    messagingSenderId: '343354554227',
    projectId: 'fir-project-demo-5c1a9',
    storageBucket: 'fir-project-demo-5c1a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5eqYqNL_S7lSU7C72XFebc0PDewDIHD8',
    appId: '1:343354554227:ios:08d9979ece97181158b706',
    messagingSenderId: '343354554227',
    projectId: 'fir-project-demo-5c1a9',
    storageBucket: 'fir-project-demo-5c1a9.appspot.com',
    iosBundleId: 'com.example.firebaseProjectDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5eqYqNL_S7lSU7C72XFebc0PDewDIHD8',
    appId: '1:343354554227:ios:50dc8dff77279dca58b706',
    messagingSenderId: '343354554227',
    projectId: 'fir-project-demo-5c1a9',
    storageBucket: 'fir-project-demo-5c1a9.appspot.com',
    iosBundleId: 'com.example.firebaseProjectDemo.RunnerTests',
  );
}