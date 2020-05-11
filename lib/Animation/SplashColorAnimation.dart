import 'package:flutter/material.dart';
import 'package:charoit_rhp/main.dart';
import 'package:shimmer/shimmer.dart';



import 'package:simple_animations/simple_animations/controlled_animation.dart';import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class ColorAnimation extends StatelessWidget {
  final Color color_1;
  final Color color_2;

  ColorAnimation(this.color_1, this.color_2);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("the_color").add(
        Duration(milliseconds: 1500),
        ColorTween(
          begin: color_1,
          end: color_2,
        ))
    ]);
    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          alignment: Alignment.center,
          child: Shimmer.fromColors(
                baseColor: Color(0xff538be0),
                highlightColor: Color(0xff00e2bb),
                child: Container(
                  child: Center(
                    child: Text(
                      "MARIS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                      ),
                    ),
                  ),
                ),
              ),
          decoration: BoxDecoration(
            color: animation["the_color"],
          ),
        );
      },
    );
  }
}