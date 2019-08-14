import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'textFormField.dart';
import 'colors.dart';
import 'fieldValidations.dart';
import 'icons.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TextForm {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool click = true;
  double bottom;
  CreateIcon icon;

  GradientColor gradient;

  Validations validator;

  @override
  void initState() {
    icon = CreateIcon();
    validator = Validations();

    gradient = GradientColor();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bottom = MediaQuery.of(context).viewInsets.bottom;
    final double height = MediaQuery.of(context).size.height;
    //   final double width = MediaQuery.of(context).size.width;
    print(bottom);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 60, 179, 1),
          title: Text(
            "Welcome",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                    colors: gradient.backGradient,
                  ),
                ),
              ),
//              Positioned(
//                top: 0.0,
//                bottom: -bottom,
//                child: Image.asset(
//                  'assets/images/f270716487fa746dbf3c2fbcb105a0a1.jpg',
//                  fit: BoxFit.fill,
//                ),
//              ),

              Form(
                key: _globalKey,
                child: Center(
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Please enter your personal info",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          CreateTextFormField(
                              'Name', icon.nameIcon, validator.name),
                          SizedBox(
                            height: 20.0,
                          ),
                          CreateTextFormField(
                              'Email', icon.emailIcon, validator.email,keyField: TextInputType.emailAddress),
                          SizedBox(
                            height: 20.0,
                          ),

                          CreateTextFormField(
                              'Password', icon.passIcon, validator.pass,
                              obs: true),
                          SizedBox(
                            height: 35.0,
                          ),
                          Container(
                            color: Color.fromRGBO(128, 170, 255, 1),
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 0.0,
                              color: Colors.transparent,
                              onPressed: () {
                                signUp();
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
  Future<void> signUp() async {
    final _formState = _globalKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: userEmail, password: userPassword);

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
}
