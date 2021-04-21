
import 'dart:convert';

import 'package:demo_app/core/AppColors.dart';
import 'package:demo_app/views/TextRubikRegular.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class ActivitySingleUserScreen extends StatefulWidget {
  var nameList;
  ActivitySingleUserScreen(this.nameList);

  @override
  SingleUserState createState() => SingleUserState();
}

class SingleUserState extends State<ActivitySingleUserScreen> {

  AppColors _appColors = new AppColors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.nameList);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.nameList['firstName']),
      ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor("B3BF93"),
                  ),
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(15))
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top:20.0),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: NetworkImage(widget.nameList["imageUrl"].toString()), // no matter how big it is, it won't overflow
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRubikRegular("Full Name","left",14.0,Colors.black26,false),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextRubikRegular('${widget.nameList['firstName']} ${widget.nameList['lastName']}',"left",18.0,Colors.black,false),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Divider(
                          color: _appColors.textColorGrey
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRubikRegular("Email","left",14.0,Colors.black26,false),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextRubikRegular('${widget.nameList['email']}',"left",18.0,Colors.black,false),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Divider(
                            color: _appColors.textColorGrey
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRubikRegular("Contact Number","left",14.0,Colors.black26,false),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextRubikRegular('${widget.nameList['contactNumber']}',"left",18.0,Colors.black,false),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Divider(
                            color: _appColors.textColorGrey
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRubikRegular("Date Of Birth","left",14.0,Colors.black26,false),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextRubikRegular('${widget.nameList['dob']}',"left",18.0,Colors.black,false),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }


}

