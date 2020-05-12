import 'package:flutter/material.dart';

import 'package:charoit_rhp/Animation/FadeAnimation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/city1.png",
                  scale: 10,
                ),
                Positioned(
                  top: 160,
                  child: Fade(
                    2.4,
                    Image.asset(
                      "assets/images/sport_blue_car.png",
                      scale: 5.6,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
