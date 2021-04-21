import 'package:demo_app/activities/ActivityHomeScreen.dart';
import 'package:demo_app/core/AppColors.dart';
import 'package:demo_app/views/TextRubikRegular.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivitySplashScreen extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<ActivitySplashScreen> {

  AppColors _appColors = new AppColors();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("drawables/logo.png",
                   // height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextRubikRegular("DEMO APP", "center", 30.0, _appColors.textColorDark, true),
            )
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityHomeScreen(),
              ),
            );
    });
  }
}
