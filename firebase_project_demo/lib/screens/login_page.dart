import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_demo/models/text.dart';
import 'package:firebase_project_demo/models/textformfield.dart';
import 'package:firebase_project_demo/screens/dashboard_page.dart';
import 'package:firebase_project_demo/screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpwdcontroller = TextEditingController();

  void logInUser() async {
    const CircularProgressIndicator(
      color: Colors.red,
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: useremailcontroller.text.toLowerCase(),
        password: userpwdcontroller.text.toString(),
      );
      Fluttertoast.showToast(
        msg: 'Successfully Logged-in',
        backgroundColor: Colors.green,
        toastLength: Toast.LENGTH_LONG,
      );

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardPage(
              useremail: useremailcontroller.text.toLowerCase(),
            ),
          ),
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.red,
      );
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(
          'Login Page',
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  text('!! Welcome !!'),

                  const SizedBox(height: 25),

                  // useremail TextField
                  textFormField(
                    useremailcontroller,
                    hintText: "Enter your Email-id",
                  ),

                  // Password TextField
                  textFormField(
                    userpwdcontroller,
                    hintText: "Enter your Password",
                    labelText: 'Password',
                  ),

                  // Forgot Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        text(
                          'Forgot Password?',
                          color: Colors.grey.shade700,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // signin button

                  ElevatedButton(
                    onPressed: logInUser,
                    child: text('Sign Up'),
                  ),

                  const SizedBox(height: 30),

                  // not a member the Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                        "Don't have account?",
                        size: 16.0,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        ),
                        child: text(
                          "Register now",
                          size: 18.0,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
