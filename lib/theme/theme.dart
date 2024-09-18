import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      surface: Colors.white,
      secondary: Color(0xffebedfa),
      primary: Color(0xff181a26)),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color(0xff181a26),
      secondary: Color(0xff272d3b),
      primary: Colors.white,
    ));
