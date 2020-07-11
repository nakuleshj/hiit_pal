import 'package:flutter/material.dart';
import 'package:hiittimer/components/end_workout.dart';
import 'package:hiittimer/constants.dart';
class TimerFace extends StatefulWidget {
  TimerFace({
    @required this.currentColor,
    @required this.controller,
    @required this.timeInSeconds,
    @required this.timerValue,
    @required this.timerCaption,
    @required this.roundNumber,
  });

  final Color currentColor;
  final AnimationController controller;
  final int timeInSeconds;
  final double timerValue;
  final String timerCaption;
  final int roundNumber;

  @override
  _TimerFaceState createState() => _TimerFaceState();
}
class _TimerFaceState extends State<TimerFace> {
  bool isRunning=true;
  IconData currentIcon=Icons.pause_circle_outline;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.timerCaption!="FINISH"?<Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(widget.timerCaption=='FINISH' || widget.timerCaption=="PREPARE"?'':'Round: ${widget.timerCaption=='REST'?(widget.roundNumber-1).toString():widget.roundNumber.toString()}',style: TextStyle(color: kCardTextColor,fontSize: 36,fontWeight: FontWeight.bold,fontFamily: 'BlackOpsOne'),),
        ),
        if(widget.timerCaption!="FINISH")
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(widget.timerCaption,style: TextStyle(color: widget.currentColor,fontSize: 60,fontWeight: FontWeight.bold,fontFamily: 'BlackOpsOne'),),
        ),
        SizedBox(height: 20,),
        Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 350,
              width: 350,
              child:

            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(widget.currentColor),
                value: widget.controller.value,
                strokeWidth: 15,
                backgroundColor: kCardTextColor,
              )
            ),
            Container(
              //alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.timeInSeconds-(widget.timerValue * widget.timeInSeconds).toInt()}",
                    style: TextStyle(
                      color: kCardTextColor,
                      fontSize: 85,
                      fontWeight: FontWeight.bold,
                        fontFamily: 'BlackOpsOne'
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    child: Icon(widget.timerCaption=="FINISH"?null:currentIcon,color: kCardTextColor,size: 80,),
                    onTap: (){
                      if(isRunning){
                        widget.controller.stop();
                        isRunning=false;
                        setState(() {
                          currentIcon=Icons.play_circle_outline;
                        });
                      }
                      else{
                        widget.controller.forward(from:widget.timerValue);
                        isRunning=true;
                        setState(() {
                          currentIcon=Icons.pause_circle_outline;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ]:<Widget>[EndWorkout()],
    );
  }
}
