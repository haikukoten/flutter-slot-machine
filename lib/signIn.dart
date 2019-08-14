import 'package:flutter/material.dart';
import 'Forgot password/sendEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'signUp.dart';
import 'textFormField.dart';
import 'colors.dart';
import 'fieldValidations.dart';
import 'icons.dart';

//import 'buttonTheme.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>
    with TickerProviderStateMixin, TextForm {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AnimationController _controller;
  Animation<num> animation;

  bool click = true;
  double bottom;

  CreateIcon icon;

  Validations validator;

  GradientColor gradient;

  Widget soc(String path) {
    return ButtonTheme(
        buttonColor: Colors.transparent,
        height: animation.value,
        minWidth: animation.value,
        child: ScaleTransition(
            scale: _controller,
            child: RaisedButton(
                onPressed: () {},
                elevation: 100,
                child: Image.asset(
                  path,
                  height: 40,
                  width: 40,
                  color: Colors.white,
                ))));
  }

  @override
  void initState() {
    icon = CreateIcon();
    validator = Validations();

    gradient = GradientColor();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 40.0).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bottom = MediaQuery.of(context).viewInsets.bottom;
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
//                  'assets/f270716487fa746dbf3c2fbcb105a0a1.jpg',
//                  fit: BoxFit.fill,
//                ),
//              ),
              Form(
                autovalidate: true,
                key: _globalKey,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradient.columnGradient,
                        )),
                    height: double.infinity,
                    margin: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 24,
                      bottom: 24,
                    ),
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: height / 4,
                            ),
                            CreateTextFormField(
                                'Email', icon.emailIcon, validator.email,keyField: TextInputType.emailAddress),
                            SizedBox(
                              height: height / 20,
                            ),
                            CreateTextFormField(
                                'Password', icon.passIcon, validator.pass,
                                obs: true),

                            SizedBox(
                              height: height / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  width: height / 4,
                                ),
                                RaisedButton(
                                  elevation: 100,
                                  color: Colors.transparent,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>ForgotPass()));
                                  },
                                  child: Text(
                                    "Forgtot password?",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 50,
                            ),
                            Container(
                              color: Color.fromRGBO(128, 170, 255, 1),
                              width: double.infinity,
                              child: RaisedButton(
                                elevation: 0.0,
                                color: Colors.transparent,
                                onPressed: () {
                                   signIn();
                                },
                                child: Text(
                                  "Sign in",
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            Container(
                              color: Color.fromRGBO(128, 170, 255, 1),
                              width: double.infinity,
                              child: RaisedButton(
                                elevation: 0.0,
                                focusElevation: 0.1,
                                color: Colors.transparent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Sign up",
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            RaisedButton(
                              color: Colors.transparent,
                              elevation: 100,
                              onPressed: () {
                                if (click == true) {
                                  _controller.forward();
                                  click = false;
                                } else {
                                  _controller.reverse();
                                  click = true;
                                }
                                setState(() {});
                              },
                              child: Text(
                                "Sign up with",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Spacer(
                                  flex: 6,
                                ),
                                soc("assets/images/48418309_352162025598188_6878091392388694016_n.png"),
                                soc("assets/images/48418309_352162025598188_6878091392388694016_n.png"),
                                soc("assets/images/48418309_352162025598188_6878091392388694016_n.png"),
                                Spacer(
                                  flex: 6,
                                ),
                              ],
                            ),
//                        SizedBox(
//                          height: 100,
//                        ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
  void sendData(FirebaseUser user) async {
    await Firestore.instance.collection('users').document(user.uid).setData({
      'email': userEmail,
      'password': userPassword,
      'lastPasswords': [userPassword]
    });
  }
  Future<void> signIn() async {
    final _formState = _globalKey.currentState;

    if (_formState.validate()) {
      _formState.save();

      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: userEmail, password: userPassword);
        if (user.isEmailVerified) {
          sendData(user);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                    user: user,
                  )));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) => popup("Email is'nt verified"));
        }
      } catch (error) {
        print(error.message);
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                popup('Invalid email or password'));
      }
    }
  }
  Widget popup(String body) {
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

}
