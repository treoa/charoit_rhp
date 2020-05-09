import 'package:charoit_rhp/main.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Fade(
                      1.0, 
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png'),
                          )
                        ),
                      ),
                    )
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Fade(
                      1.3, 
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png'),
                          )
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 40,
                    width: 80,
                    height: 200,
                    child: Fade(
                      1.5,
                      Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'),
                        ),
                      ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 80,
                      ),
                      child: Fade(
                        1.6,
                        Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column (
                children: <Widget>[
                  Fade(1.7,
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2)
                          )
                        ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                )
                              )
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(.5),
                                filled: true,
                                labelText: "Username",
                                labelStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16
                                ),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              )
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                )
                              )
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(.5),
                                filled: true,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16
                                ),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              )
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Fade (
                    2,
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, .2),
                            Color.fromRGBO(143, 148, 251, .6),
                          ]
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Fade(
                    1.5,
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ],
              )
            )
          ],
        )
      ),
    );
  }
}
