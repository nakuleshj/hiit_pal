import 'package:flutter/material.dart';
import 'package:hiittimer/constants.dart';
import 'package:hiittimer/components/timer_face.dart';
import 'package:audioplayers/audio_cache.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({@required this.workTime,@required this.restTime,@required this.selectedNoOfRounds});
  final int workTime;
  final int restTime;
  final int selectedNoOfRounds;
  final player=AudioCache();
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  Color currentColor = kRestColor;
  AnimationController controller;
  int timeInSeconds=20;

  double timerValue=0.0;
  bool isWorkTime=false;
  bool isPrepareTime=true;
  int roundNumber=1;
  bool isFinished=false;

  void toggleStates(){
    if(isWorkTime){
      roundNumber++;
      print("Round: $roundNumber");
    }
    isWorkTime=!isWorkTime;
  }
  void playSound(){
    widget.player.play(isWorkTime?'work.wav':'rest.wav');
  }
  void startTimer(){
    playSound();
    controller.duration=Duration(seconds: isWorkTime?widget.workTime:widget.restTime);
    controller.forward();
    controller.addListener(() {
      setState(() {
        timerValue=controller.value;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      //duration: Duration(seconds: isWorkTime?workTime:restTime),
      vsync: this,
    );
    startTimer();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        if(isPrepareTime)
          isPrepareTime=false;
        controller.reset();
      }
        //currentColor = kRestColor;
      else if(status==AnimationStatus.dismissed)
       {
         toggleStates();
         if(roundNumber<=widget.selectedNoOfRounds){
           startTimer();
         }
         else{
           setState(() {
             isFinished=true;
           });
         }
       }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SafeArea(
          child: TimerFace(currentColor: isWorkTime?kWorkColor:kRestColor, controller: controller, timeInSeconds: isWorkTime?widget.workTime:(isFinished?0:widget.restTime), timerValue: timerValue,timerCaption: isWorkTime?"WORK":(isPrepareTime?"PREPARE":(isFinished?"FINISH":"REST")),roundNumber: roundNumber,),
        ),
      ),
    );
  }
}


