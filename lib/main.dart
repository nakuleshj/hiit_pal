import 'package:flutter/material.dart';
import 'package:hiittimer/screens/timer_screen.dart';
import 'package:hiittimer/screens/timer_configuration.dart';
void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  //AnimationController controller=AnimationController();
  //Animation animate=CurvedAnimation(curve: );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerConfig(),//TimerScreen(workTime: 2,restTime: 1,selectedNoOfRounds: 2,),
    );
  }
}
