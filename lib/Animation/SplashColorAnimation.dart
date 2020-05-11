import 'package:flutter/material.dart';

class SplashColorAnimation extends StatefulWidget {

  final Widget child;
  SplashColorAnimation({Key key, this.child}) : super(key: key);

  @override
  _SplashColorAnimationState createState() => _SplashColorAnimationState(child);
}

class _SplashColorAnimationState extends State<SplashColorAnimation> {
  final Widget child;

  _SplashColorAnimationState(this.child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff746ABA),
    );
  }
}