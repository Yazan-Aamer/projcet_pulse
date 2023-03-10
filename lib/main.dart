import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_pulse/app_widget.dart';
import 'package:project_pulse/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 3000);

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      debugPrint('user is null');
    } else {
      debugPrint('user is here');
    }
  });

  runApp(const AppWidget());
}
