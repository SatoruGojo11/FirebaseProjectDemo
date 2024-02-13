import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project_demo/firebase_options.dart';
import 'package:firebase_project_demo/screens/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
