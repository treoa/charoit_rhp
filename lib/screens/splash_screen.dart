import 'package:charoit_rhp/Animation/SplashColorAnimation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState ();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashColorAnimation(
        Color(0xffff799d),
        Color(0xff746aba),
        Container (
        child: Stack (
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Center(
                child: Image.asset("assets/images/background.png"),
              )
            ),
            Shimmer.fromColors(
              baseColor: Color(0xfff9f871),
              highlightColor: Color(0xffff799d),
              child: Container(
                child: Center(
                  child: Text(
                    "CHAROIT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
  
}