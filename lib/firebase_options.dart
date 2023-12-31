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
    apiKey: 'AIzaSyDzvAyapm7poTa24k8W7fFZUd-8bs2FyC4',
    appId: '1:623485120660:web:863cc53a34ae086bb64481',
    messagingSenderId: '623485120660',
    projectId: 'flashchat-dae5c',
    authDomain: 'flashchat-dae5c.firebaseapp.com',
    storageBucket: 'flashchat-dae5c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYC4T5rjUcT0gTlUl7uwJCdDIx7fHPj7E',
    appId: '1:623485120660:android:c0c1e7bc0b962e2cb64481',
    messagingSenderId: '623485120660',
    projectId: 'flashchat-dae5c',
    storageBucket: 'flashchat-dae5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0gJMXaD7cJwxl2nYdbOEIZx1PAXVmuVY',
    appId: '1:623485120660:ios:e86a6e0533288b8cb64481',
    messagingSenderId: '623485120660',
    projectId: 'flashchat-dae5c',
    storageBucket: 'flashchat-dae5c.appspot.com',
    iosClientId: '623485120660-rm4pqc8e0orkmnv8btcpkb86clo666ab.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChatFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0gJMXaD7cJwxl2nYdbOEIZx1PAXVmuVY',
    appId: '1:623485120660:ios:f2e949e3a43d46f8b64481',
    messagingSenderId: '623485120660',
    projectId: 'flashchat-dae5c',
    storageBucket: 'flashchat-dae5c.appspot.com',
    iosClientId: '623485120660-rubrjlabfdo7b9cnlfheugelontsj0pv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChatFlutter.RunnerTests',
  );
}
