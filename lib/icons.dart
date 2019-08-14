import 'package:flutter/material.dart';
class CreateIcon{
  Icon _nameIcon;
  Icon _emailIcon;
  Icon _logIcon;
  Icon _passIcon;
  CreateIcon(){
    _nameIcon = Icon(
      Icons.person_outline,
      color: Colors.white,
    );
    _emailIcon = Icon(
      Icons.email,
      color: Colors.white,
    );
    _logIcon = Icon(
      Icons.account_box,
      color: Colors.white,
    );
    _passIcon = Icon(
      Icons.lock,
      color: Colors.white,
    );
  }

  Icon get nameIcon => _nameIcon;
  Icon get emailIcon => _emailIcon;
  Icon get logIcon => _logIcon;
  Icon get passIcon => _passIcon;

}