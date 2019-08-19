import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'textFormField.dart';

mixin User on TextForm {
  static String _name ;
  static String _email ;
  void sendData(FirebaseUser user) async {
    await Firestore.instance.collection('users').document(user.uid).setData({
      'userName': userName,
      'email': userEmail,
      'password': userPassword,
    });
  }

  Future<void> getData(FirebaseUser user) async {
    DocumentReference allInfo =
        Firestore.instance.collection('users').document(user.uid);
    var getDoc = allInfo.get().then((doc) {
      if (!doc.exists) {
        print('No such document!');
      } else {
        _name = doc.data['userName'];
        _email = doc.data['email'];
        print(_name + '    anun1');
        print(_email + '      mail');
      }
    }).catchError((err) {
      print(err);
    });
  }

  Future<void> signIn(
      BuildContext context, FormState globalKeyCurrentState) async {
    if (globalKeyCurrentState.validate()) {
      globalKeyCurrentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: userEmail, password: userPassword);

        if (user.isEmailVerified) {
          await getData(user);
          await Future.delayed(Duration(milliseconds: 500));
          print(_name + '    anun2');
          print(_email + '      mail');

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        user: user,
                      )));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  popup("Email is'nt verified", context));
        }
      } catch (error) {
        print(error.toString() + 'error11111');
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                popup('Invalid email or password', context));
      }
    }
  }

  Future<void> signUp(
      BuildContext context, FormState globalKeyCurrentState) async {
    if (globalKeyCurrentState.validate()) {
      globalKeyCurrentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userEmail, password: userPassword);

        await user.sendEmailVerification();

        Navigator.of(context).pop();
      } catch (error) {
        print(error.message.toString() + "aaaaaa");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(error.message),
                actions: <Widget>[
                  FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              );
            });
      }
    }
  }

  Widget popup(String body, BuildContext context) {
    return AlertDialog(
      content: Text(body),
      actions: <Widget>[
        FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }

  String get userNameFromDB => _name;
  String get userEmailFromDB => _email;
}
