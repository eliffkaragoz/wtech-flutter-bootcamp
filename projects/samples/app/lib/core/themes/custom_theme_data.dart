import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFFE3EEFF),
      scaffoldBackgroundColor: const Color(0xFFFAFCFF),
      iconTheme: const IconThemeData(color: Color(0xFF002359)),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color(0xFF002359), fontSize: 32, fontWeight: FontWeight.w600),
        headline2: TextStyle(color: Color(0xFF002359), fontSize: 15, fontWeight: FontWeight.w600),
        bodyText1: TextStyle(color: Color(0xFF002359), fontSize: 15, fontWeight: FontWeight.w400),
      ),
      brightness: Brightness.dark,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFF02327D),
      scaffoldBackgroundColor: const Color(0xFF002359),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Color(0xFFFAFCFF), fontSize: 32, fontWeight: FontWeight.w600),
        headline2: TextStyle(color: Color(0xFFFAFCFF), fontSize: 15, fontWeight: FontWeight.w600),
        bodyText1: TextStyle(color: Color(0xFFFAFCFF), fontSize: 15, fontWeight: FontWeight.w400),
      ),
      brightness: Brightness.light,
    );
  }
}
