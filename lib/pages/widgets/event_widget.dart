import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constans.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // fontsize
    final double fontSize = screenWidth * .015;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        height: 150,
        width: 150,
        decoration: BoxDecoration(),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade500),
              borderRadius: BorderRadius.circular(screenWidth * .02)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  //   icon
                  Container(
                      padding: EdgeInsets.all(screenWidth * .01),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green.shade500),
                          borderRadius: BorderRadius.circular(screenWidth * .02)
                      ),
                      child: Image.asset(Constants.calendarPlusIcon, height: screenWidth * .025,color: Colors.green,)),
                  //   title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Constants.widgetText, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.green),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .01,),
              Row(
                children: [
                  Text('09:00 AM - 10:00 AM', style: TextStyle(fontSize: fontSize, color: Colors.green),)
                ],
              ),
              SizedBox(height: screenHeight * .015,),
              Row(
                children: [
                  CircleAvatar(),
                  CircleAvatar(),
                  Text('....'),
                  CircleAvatar(child: Text('5+'),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
