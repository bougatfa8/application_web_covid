import 'package:covid/auth/signup.dart';
import 'package:covid/crud/addnotes.dart';
import 'package:covid/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:covid/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(246, 243, 241, 241),
        primaryColor: Colors.blue,
        buttonColor: Colors.blue,
      ),
      routes: {
        "Login": (context) => const Login(),
        "signup": (context) => const Signup(),
        "homepage": (context) => liste_verte(),
        "addnotes": (context) => const Addnotes()
      },
    );
  }
}
