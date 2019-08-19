import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUserInfo {
  String _id;
  String _name;
  String _email;

  //GetUserInfo(this._id,this._name, this._email);

  GetUserInfo.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _email = snapshot.value['email'];
  }
  String get name => _name;

  String get email => _email;

  String get id => _id;
}
