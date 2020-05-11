import 'package:flutter/material.dart';

class SplashColorAnimation extends StatefulWidget {
  final Color color;
  final Color bgColor;
  final Widget child;

  SplashColorAnimation(this.color, this.bgColor, this.child);

  @override
  _SplashColorState createState() => _SplashColorState(color, bgColor, child);
}
  
//bgColor = Color which is initial one, while "color" is color to which transition must be
  
class _SplashColorState extends State<SplashColorAnimation>{
  final Color color;
  final Color bgColor;
  final Widget child;

  _SplashColorState(this.color, this.bgColor, this.child);
  
  @override
  Widget build(BuildContext context) {
    Color _newColor = color;
    return Stack(
      children: <Widget>[
        Center(
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: bgColor, end: color), 
            duration: Duration(seconds: 4),
            onEnd: () {
              setState(() {
                _newColor = _newColor == color ? bgColor : color;
              });
            },
            builder: (_,Color color, __) {
              return ColorFiltered(
                child: Container(
                  decoration: new BoxDecoration(
                    color: bgColor,
                  )
                ),
                colorFilter: ColorFilter.mode(color, BlendMode.modulate),
              );
            },
          ),
        ),
      ],
    );
  }
}