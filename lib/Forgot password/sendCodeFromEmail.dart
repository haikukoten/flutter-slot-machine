import 'package:flutter/material.dart';
import 'package:slotapp/Forgot%20password/resetPassword.dart';
import '../textFormField.dart';
import '../colors.dart';
import '../fieldValidations.dart';
import '../icons.dart';

class SendCode extends StatefulWidget {
  @override
  _SendCodeState createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> with TickerProviderStateMixin, TextForm {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  double bottom;

  CreateIcon icon;

  Validations validator;

  GradientColor gradient;

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
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 60, 179, 1),
          title: Text(
            "Reset your password",
            style: TextStyle(color: Colors.white, fontSize: 20),
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
//                  'assets/f270716487fa746dbf3c2fbcb105a0a1.jpg',
//                  fit: BoxFit.fill,
//                ),
//              ),
              Form(
                autovalidate: true,
                key: _globalKey,
                child: Center(
                  child: Container(
//                    decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                          begin: Alignment.topCenter,
//                          end: Alignment.bottomCenter,
//                          colors: gradient.columnGradient,
//                        )),
                    height: double.infinity,
                    margin: EdgeInsets.only(
                      left: 24,

                      right: 24,

                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: height/5 ,
                          ),
                          CreateTextFormField(
                              'Code', icon.emailIcon, validator.name,keyField: TextInputType.numberWithOptions()),
                          SizedBox(
                            height: height/10 ,
                          ),
                          Container(
                            height: height/20,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 60, 179, 1),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                )


                            ),
                            //width: double.infinity,
                            child: FlatButton(

                              color: Colors.transparent,
                              onPressed: () {
                                if (_globalKey.currentState.validate()) {
                                  _globalKey.currentState.save();
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>ResetPassword()));
                              },
                              child: Text(
                                "Send",
                                style:
                                TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          )
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
}







