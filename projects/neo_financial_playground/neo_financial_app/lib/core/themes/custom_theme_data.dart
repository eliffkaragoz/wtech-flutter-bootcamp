import 'package:flutter/material.dart';

class CustomTheme {
  static Color categoryIconColor = Colors.white;
  static ThemeData customThemeData() {
    return ThemeData(
      useMaterial3: false,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.blue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
      ),
      inputDecorationTheme:
          const InputDecorationTheme(iconColor: Colors.black54),
      iconTheme: const IconThemeData(color: Colors.black54),
      //floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    );
  }
}
