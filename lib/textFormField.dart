import 'package:flutter/material.dart';

mixin TextForm {


  String _userName;
  String _userEmail;
  String _userPassword;

  void getUserInfo(String text, String fieldInfo) {
    if (text == "Name") {
      _userName = fieldInfo;
    } else if (text == "Email") {
      _userEmail = fieldInfo;
    }  else if (text == "Password") {
      _userPassword = fieldInfo;
    }
  }

  TextFormField CreateTextFormField(String text, Widget icon, String Function(String) validations,
      {bool obs: false,TextInputType keyField:TextInputType.text}) {
    return  TextFormField(
      keyboardType: keyField,
      autovalidate: true,
      obscureText: obs,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: icon,
        enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color: Colors.white, style: BorderStyle.solid)),
        hintText: text,
        hintStyle: TextStyle(color: Colors.white),
      ),
      validator: validations,
      onSaved: (fieldInfo) {
        getUserInfo(text, fieldInfo);
      },
    );
  }



  String get userName => _userName;
  String get userEmail => _userEmail;
  String get userPassword => _userPassword;
}
