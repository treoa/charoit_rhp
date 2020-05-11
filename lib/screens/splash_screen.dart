import 'package:charoit_rhp/Animation/SplashColorAnimation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState ();
}

class _SplashScreenState extends State<SplashScreen> 
  with SingleTickerProviderStateMixin {
  AnimationController animControl;

  @override
  void initState() {
    super.initState();
    animControl = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    animControl.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashColorAnimation(
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