import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:charoit_rhp/Animation/FadeAnimation.dart';

class LoginPage extends StatelessWidget {
  final _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(36, 43, 47, 1),
        padding: const EdgeInsets.symmetric(horizontal: 43.0),
        child: Form(
          key: _formkey,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildPhoneNumber(),
              ],
            )
          )
        )
      )
    );
  }

  InputDecoration _buildInputDecoration(String hint, String iconPath) {
    return InputDecoration(
      focusedBorder: UnderlineInputBorder (
        borderSide: BorderSide(color: Color.fromRGBO(252, 252, 252, 1)),
      ),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
        borderSide:BorderSide (color: Color.fromRGBO(151, 151, 151, 1)),
      ),
      hintStyle: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1),
      ),
      icon: iconPath != '' ? Image.asset(iconPath) : null,
      errorStyle: TextStyle(
        color: Color.fromRGBO(248, 218, 87, 1),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          color: Color.fromRGBO(248, 218, 87, 1),
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(248, 218, 87, 1),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber () {
    final _PhoneNumberController = TextEditingController();

    return TextFormField(
      obscureText: false,
      controller: _PhoneNumberController,
      validator: (value) => !isPhoneNumber(value) ? "Неправильный номер телефона" : null,
      style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1),
      ),
      // decoration: _buildInputDecoration("Phone Number", "assets/images/background.png"),
    );
  }

  bool isPhoneNumber(String value) {
    String regex = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
  }
}
