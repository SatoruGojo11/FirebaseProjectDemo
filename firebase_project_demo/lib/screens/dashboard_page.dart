import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project_demo/models/text.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.useremail});

  final String? useremail;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic> userdata = {};
  String username = '';
  String useremail = '';
  String userpwd = '';
  int count = 0;

  readUserData() {
   
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Demo1').doc(widget.useremail);
    documentReference.get().then(
      (DocumentSnapshot snapShot) {
        if (snapShot.exists) {
          username = snapShot.get('Username');
          useremail = snapShot.get('Useremail');
          userpwd = snapShot.get('UserPassword');
          log(username);
          log(useremail);
          log(userpwd);
          userdata = snapShot.data()! as Map<String, dynamic>;
        } else {
          log('No data');
        }
      },
    );
    setState(() {});
  }

  deleteUserData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Demo1').doc(widget.useremail);
    documentReference.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: text('Home Page'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: deleteUserData,
            leading: text(index),
            title: text('Username :- ${userdata['Username']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text('Useremail :- ${userdata['Useremail']}'),
                text('UserPassword :- ${userdata['UserPassword']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
