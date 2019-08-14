import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'getUserInfo.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with GetUserInfo {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: gettingData(),
    );
  }
}