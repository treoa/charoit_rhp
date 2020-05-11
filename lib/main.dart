import 'package:flutter/material.dart';
import 'package:charoit_rhp/screens/login_page.dart';
import 'package:charoit_rhp/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Charoit",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

}