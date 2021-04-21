
import 'dart:convert';

import 'package:demo_app/activities/ActivitySingleUserScreen.dart';
import 'package:demo_app/core/AppColors.dart';
import 'package:demo_app/views/TextRubikRegular.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:toast/toast.dart';

class ActivityHomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<ActivityHomeScreen> {

  AppColors _appColors = new AppColors();
  List _list =[];

  ScrollController _semicircleController = ScrollController();
  // List<String> usersList = <String>[];
  int pageCount=1;
  bool _isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });


    _semicircleController.addListener(() {
      if (_semicircleController.position.atEdge) {
        if (_semicircleController.position.pixels != 0) {
          setState(() {
            pageCount = pageCount+1;
          });
          Toast.show("Loading more 50", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

          print('list at bottom-------');
        }
      }
    });

  }

  loadJson() async {
    String data = await rootBundle.loadString('drawables/employees.json');
    var jsonResult = json.decode(data);
    setState(() {
      _list = jsonResult;
      _isLoading = false;
    });

    //sort the list
    _list.sort((a, b) {
      return a["firstName"].toLowerCase().compareTo(b["firstName"].toLowerCase());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
            _isLoading
                ?
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Loading(
                    indicator: BallPulseIndicator(),
                    size: 60.0,
                    color: Colors.blue),
              ),
            )
                : SemicircleDemo(
              controller: _semicircleController,
              nameList: _list,
              pageCount: pageCount,
            ),
          ),
        )
    );
  }


}


class SemicircleDemo extends StatelessWidget {
  final List nameList;
  final int count=50;
  final int pageCount;


  final ScrollController controller;

  const SemicircleDemo({Key key, @required this.controller, this.nameList,this.pageCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.semicircle(
      labelTextBuilder: (offset) {
        final int currentItem = offset ~/ 40;
        var letter = currentItem <= nameList.length - 1
            ? nameList[currentItem]["firstName"].substring(0, 1)
            : nameList.last["firstName"].substring(0, 1);
        return Text("$letter");
      },
      alwaysVisibleScrollThumb: true,
      labelConstraints: BoxConstraints.tightFor(width: 80.0, height: 30.0),
      controller: controller,
      child: ListView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => ActivitySingleUserScreen(nameList[index])));
            },
            child: new Card(
              elevation: 6,  // Change this
              shadowColor: Colors.black,  // Change this
              // margin: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(nameList[index]["imageUrl"].toString()), // no matter how big it is, it won't overflow
                ),
                title: TextRubikRegular('${nameList[index]["firstName"]} ${nameList[index]["lastName"]}',"left",14.0,Colors.black,false),
                subtitle: TextRubikRegular('${nameList[index]["email"]}',"left",12.0,Colors.grey,false),
              ),
            ),
          );
        },
        itemCount: count*pageCount,
      ),
    );
  }
}
