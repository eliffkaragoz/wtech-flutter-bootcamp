import 'package:flutter/material.dart';
import 'package:starbucks_playground/views/splash/custom_splash_screen.dart';
import 'custom_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomThemes.customThemes(),
      home: const Splash(),
      // home: splashScree,
    );
  }
}
