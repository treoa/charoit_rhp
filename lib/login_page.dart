import 'package:charoit_rhp/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        child: Column (
          children: <Widget>[
            Container (
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(assetName))
              ),
            )
          ],
        )
      ),
    );
  }
} 
