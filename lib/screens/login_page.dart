import 'package:charoit_rhp/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:charoit_rhp/Animation/SideFadeAnimation.dart';
import 'package:charoit_rhp/Animation/UpFadeAnimation.dart';
import 'package:shimmer/shimmer.dart';

class LoginPage extends StatelessWidget{
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phoneNum, BuildContext context) async {
    FirebaseAuth _fauth = FirebaseAuth.instance;

    _fauth.verifyPhoneNumber(
      // [1]. This is our phone number
      phoneNumber: phoneNum, 


      // [2]. This is our duration, which is given to user to verify a sent code
      timeout: Duration(seconds: 60),


      // [3]. The process below is being called when the verification is completed and final steps are being implemented
      // The whole code in this verification part firstly tries to verify the sent code automatically by [6]th part, after what \
      // trying to track whether it was automatically verified. if yes => enters here. If not => retreieves by [5]th part manually \
      // after what manually being pushed to the Home Page. And at this part "Navigator.of(context).pop();" right after the start \
      // of our function is being called to remove the dialogbox of asking of code by part [5] in the event, when even if it retrieves \
      // the code automatically by part [6] (it anyway enters to the stage [5], when autoretrieval is working, so it's worth to pop that dialog box)
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();
        AuthResult result = await _fauth.signInWithCredential(credential);

        FirebaseUser user = result.user;

        if(user != null) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomePage(user: user)
          ));
        } else {
          print("ERROR OCCURED HERE!");
        }

        // This callback is activated when the verification done automatically by codeAutoRetrieval
      },


      // [4]. The part below is being called, whenever there was some error in the verification process, handling all exceptions
      verificationFailed: (AuthException exception) {
        print(exception);
        print("ERROR");
      },


      // [5]. The part below verifies sent code. It differs from [6] part by the property, that it is not automatically verifies sent code. When sometimes [6]th part\
      // in some phones is not working, it switches anyway to this part, to give user manually enter the code and we manually pushing him to the HomePage
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog (
              title: Text("Enter the code"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _codeController,
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async{
                    AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: _codeController.text.trim());
                    AuthResult result = await _fauth.signInWithCredential(credential);

                    FirebaseUser user = result.user;

                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(user: user)
                        ),
                      );
                    } else {
                      print("ERROR OCCURED!");
                    }
                  },
                  child: Text("Send"),
                  textColor: Colors.white,
                  color: Colors.blue,
                )
              ],
            );
          }
        );
      },


      // [6]. The code below automatically checks for the code sent and tries to retrieve the code from the messages
      codeAutoRetrievalTimeout: null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UpFade(
              2,
              Shimmer.fromColors(
                baseColor: Color(0xff538be0),
                highlightColor: Color(0xff00e2bb),
                child: Container(
                  child: Center(
                    child: Text(
                      "MARIS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),            
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/city1.png",
                  scale: 10,
                ),
                Positioned(
                  top: 165,
                  child: SideFade(
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
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "+7 707 707 77 77",
                        labelText: "Phone number",
                      ),
                      controller: _phoneController,
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        hoverColor: Color(0xff4B7DD1),
                        onPressed: () {
                          final phone = _phoneController.text.trim();
                          loginUser(phone , context);
                        }, 
                        child: Text(
                          "LOGIN",
                        ),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(16),
                        color: Color(0xff538be0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
