import 'package:flutter/material.dart';
import 'package:hiittimer/constants.dart';
import 'package:hiittimer/screens/timer_screen.dart';
int workTime = 20;
int restTime = 10;
int selectedNoOfRounds = 8;
class TimerConfig extends StatefulWidget {
  @override
  _TimerConfigState createState() => _TimerConfigState();
}

class _TimerConfigState extends State<TimerConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              child: Center(
                child: Material(
                  elevation: 0,
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  child: Text(
                    'HIITpal',
                    style: TextStyle(
                      fontFamily: 'BlackOpsOne',
                      fontSize: 60,
                      color: Color(0xffdfe4ea),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 30,
                color: kCardColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'WORK',
                        style: kCardTextStyle.copyWith(color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: kMinusIcon,
                            onTap: () {
                              setState(() {
                                if (workTime > 0) workTime--;
                              });
                            },
                          ),
                          Text(
                            '$workTime',
                            style: kCardTextStyle.copyWith(color: kWorkColor),
                          ),
                          GestureDetector(
                            child: kPlusIcon,
                            onTap: () {
                              setState(() {
                                workTime++;
                              });
                            },
                          ),
                        ],
                      ),
                      Text('Seconds',style: kCardTextStyle.copyWith(color: Colors.black45,fontSize: 20),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(),
            Expanded(
              child: Card(
                elevation: 30,
                color: kCardColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'REST',
                        style: kCardTextStyle.copyWith(color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: kMinusIcon,
                            onTap: () {
                              setState(() {
                                if (restTime > 0) restTime--;
                              });
                            },
                          ),
                          Text(
                            '$restTime',
                            style: kCardTextStyle.copyWith(color: kRestColor),
                          ),
                          GestureDetector(
                            child: kPlusIcon,
                            onTap: () {
                              setState(() {
                                restTime++;
                              });
                            },
                          ),
                        ],
                      ),
                      Text('Seconds',style: kCardTextStyle.copyWith(color: Colors.black45,fontSize: 20),),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 30,
                color: kCardColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'ROUNDS',
                        style: kCardTextStyle.copyWith(color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: kMinusIcon,
                            onTap: () {
                              setState(() {
                                if (selectedNoOfRounds > 0)
                                  selectedNoOfRounds--;
                              });
                            },
                          ),
                          Text(
                            '$selectedNoOfRounds',
                            style: kCardTextStyle.copyWith(color: kAccentColor),
                          ),
                          GestureDetector(
                            child: kPlusIcon,
                            onTap: () {
                              setState(() {
                                selectedNoOfRounds++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(0),
              height: 150,
              width: double.infinity,
              color: Colors.black54,
              child: StartTimer(),
            )
          ],
        ),
      ),
    );
  }
}

class StartTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>TimerScreen(workTime: workTime, restTime: restTime, selectedNoOfRounds: selectedNoOfRounds),),);
        },
        child: Text(
          "START TIMER",
          style: kCardTextStyle.copyWith(color: Colors.white,fontSize: 45),
        ),
      ),
    );
  }
}
