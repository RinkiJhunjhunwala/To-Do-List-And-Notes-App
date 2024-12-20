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
    apiKey: 'AIzaSyBo_D7Rl2ZR7L2dWRMAtIzuPSVJCb-oNvQ',
    appId: '1:877403134636:web:731cd5aa717964a3c21d09',
    messagingSenderId: '877403134636',
    projectId: 'todo-notes-6cb46',
    authDomain: 'todo-notes-6cb46.firebaseapp.com',
    storageBucket: 'todo-notes-6cb46.firebasestorage.app',
    measurementId: 'G-39WQ8DJ8QT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyJTU3AZ95V_8gbh_qP5QOzzZ4IYPc9MY',
    appId: '1:877403134636:android:4f11ba633dd7c242c21d09',
    messagingSenderId: '877403134636',
    projectId: 'todo-notes-6cb46',
    storageBucket: 'todo-notes-6cb46.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxJ8cKrboudHA417Pst3cBoxuZTQJRj8I',
    appId: '1:877403134636:ios:ed64ed45aa4657bbc21d09',
    messagingSenderId: '877403134636',
    projectId: 'todo-notes-6cb46',
    storageBucket: 'todo-notes-6cb46.firebasestorage.app',
    iosBundleId: 'com.example.todoNotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxJ8cKrboudHA417Pst3cBoxuZTQJRj8I',
    appId: '1:877403134636:ios:ed64ed45aa4657bbc21d09',
    messagingSenderId: '877403134636',
    projectId: 'todo-notes-6cb46',
    storageBucket: 'todo-notes-6cb46.firebasestorage.app',
    iosBundleId: 'com.example.todoNotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBo_D7Rl2ZR7L2dWRMAtIzuPSVJCb-oNvQ',
    appId: '1:877403134636:web:0aa30d6c85b3d593c21d09',
    messagingSenderId: '877403134636',
    projectId: 'todo-notes-6cb46',
    authDomain: 'todo-notes-6cb46.firebaseapp.com',
    storageBucket: 'todo-notes-6cb46.firebasestorage.app',
    measurementId: 'G-LKGT33Q6J5',
  );
}
