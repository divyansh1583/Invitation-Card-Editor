import 'package:flutter/material.dart';

class TextInfo {
  TextInfo({
    required this.text,
    required this.left,
    required this.top,
    required this.fontFamily,
    required this.fontSize,
    required this.fontStyle,
    required this.color,
  });
  String text;
  double left;
  double top;
  double fontSize;
  String fontFamily;
  FontStyle fontStyle;
  Color color;
  // Custom setValues method
  void setValues(TextInfo other) {
    text = other.text;
    left = other.left;
    top = other.top;
    fontSize = other.fontSize;
    fontFamily = other.fontFamily;
    fontStyle = other.fontStyle;
    color = other.color;
  }

  TextInfo copyWith({
    String? text,
    double? left,
    double? top,
    double? fontSize,
    String? fontFamily,
    FontStyle? fontStyle,
    Color? color,
  }) {
    return TextInfo(
      text: text ?? this.text,
      left: left ?? this.left,
      top: top ?? this.top,
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      fontStyle: fontStyle ?? this.fontStyle,
      color: color ?? this.color,
    );
  }
}
