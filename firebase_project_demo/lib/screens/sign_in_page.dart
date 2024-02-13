import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_demo/models/text.dart';
import 'package:firebase_project_demo/models/textformfield.dart';
import 'package:firebase_project_demo/screens/dashboard_page.dart';
import 'package:firebase_project_demo/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final usernamecontroller = TextEditingController();
  final useremailcontroller = TextEditingController();
  final userpwdcontroller = TextEditingController();

  void createuser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: useremailcontroller.text.toLowerCase(),
      password: userpwdcontroller.text.toString(),
    );

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Demo1')
        .doc(useremailcontroller.text.toLowerCase());

    Map<String, dynamic> demodata = {
      'Username': usernamecontroller.text.toString(),
      'Useremail': useremailcontroller.text.toLowerCase(),
      'UserPassword': userpwdcontroller.text.toString(),
    };

    documentReference
        .set(demodata)
        .whenComplete(() => 'Data Added Successfully')
        .onError(
          (error, stackTrace) => log(error.toString()),
        );

    Fluttertoast.showToast(
      msg: 'Successfully Created Account',
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
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: text(
          'Sign up Page',
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Logo
                const Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // Welcome Text
                text('!! Welcome !!'),

                const SizedBox(height: 25),

                // username TextField
                textFormField(
                  usernamecontroller,
                  hintText: "Enter your Name",
                  labelText: 'Username',
                ),

                // useremail TextField
                textFormField(
                  useremailcontroller,
                  hintText: "Enter your Email-id",
                  labelText: 'Email-id',
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
                  onPressed: createuser,
                  child: text('Sign Up'),
                ),

                const SizedBox(height: 30),

                // not a member the Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Already Registered?",
                        size: 16.0, color: Colors.grey.shade800),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: text(
                        "Sign in",
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
    );
  }
}
