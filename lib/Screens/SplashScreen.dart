import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lets_head_out/utils/TextStyles.dart';
import 'package:lets_head_out/utils/consts.dart';

import 'BoardingView/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.solidMap,
                color: kwhite,
                size: 70,
              ),
              SizedBox(height: 50),
              BoldText("Telusur", 20.0, kdarkBlue),
              TypewriterAnimatedTextKit(
                text: ["Telusur App"],
                textStyle: TextStyle(
                    fontSize: 30.0, color: kwhite, fontFamily: "nunito"),
                speed: Duration(milliseconds: 150),
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return LandingPage();
      }));
    });
  }
}
