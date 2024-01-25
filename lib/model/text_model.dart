import 'package:flutter/material.dart';

class TextInfo {
  TextInfo({
    required this.text,
    required this.left,
    required this.top,
    required this.fontSize,
    required this.fontStyle,
    required this.color,
  });
  String text;
  double left;
  double top;
  double fontSize;
  FontStyle fontStyle;
  Color color;
}
