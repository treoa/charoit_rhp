import 'package:charoit_rhp/Animation/SplashColorAnimation.dart';
import 'package:flutter/material.dart';


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
      body: ColorAnimation(
        Color(0xff538BE0),
        Color(0xff3762b1),
      ),
    );
  }
}