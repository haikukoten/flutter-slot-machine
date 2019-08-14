import 'package:flutter/material.dart';

class GradientColor {
  List<Color> _backGradient = [];
  List<Color> _columnGradient = [];

  GradientColor() {
    _backGradient = [
      Color.fromRGBO(0, 60, 179, 1),
      Color.fromRGBO(0, 51, 153, 1),
      Color.fromRGBO(0, 43, 128, 1),
      Color.fromRGBO(0, 34, 102, 1),
      Color.fromRGBO(0, 26, 77, 1),
    ];
    _columnGradient = [
      Color.fromRGBO(0, 26, 77, 1),
      Color.fromRGBO(0, 34, 102, 1),
      Color.fromRGBO(0, 43, 128, 1),
      Color.fromRGBO(0, 51, 153, 1),
      Color.fromRGBO(0, 60, 179, 1),
    ];
  }

  List<Color> get backGradient => _backGradient ;
  List<Color> get columnGradient => _columnGradient;


}