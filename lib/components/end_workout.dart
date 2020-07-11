import 'package:flutter/material.dart';
import 'package:hiittimer/constants.dart';

class EndWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Material(
        elevation: 30,
        color:kCardColor,
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Text("END WORKOUT",style: TextStyle(color: kCardTextColor,fontSize: 35,fontFamily: 'BlackOpsOne'),),
        ),
      ),
    );
  }
}
