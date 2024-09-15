import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Color(0xffebedfa),
      secondary: Color(0xff181a26)),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color(0xff181a26),
      primary: Color(0xff272d3b),
      secondary: Colors.white,
    ));
