import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'textFormField.dart';
import 'fireBaseFunctions.dart';

class Home extends StatefulWidget {
  Home({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with  TextForm,User {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userNameFromDB)),
      body: Text(userEmailFromDB),
    );

  }
}