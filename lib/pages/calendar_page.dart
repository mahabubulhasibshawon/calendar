import 'package:calendar_ui/constants/constans.dart';
import 'package:calendar_ui/pages/create_schedule_dialog.dart';
import 'package:calendar_ui/pages/widgets/weekly_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // fontsize
    final double fontSize = screenWidth * .015;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            // header
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Monthname row
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(Constants.monthName, style: TextStyle(fontSize: fontSize* 2, fontWeight: FontWeight.bold),),
                        SizedBox(width: screenWidth * .01,),
                        GestureDetector(
                            onTap: (){},
                            child: Image.asset(Constants.editCalendarIcon, height: screenHeight * .03, width: screenHeight * .03,color: Colors.grey.shade500,))
                      ],
                    ),
                    Row(children: [
                      Text('${Constants.startDate} - ${Constants.endDate}', style: TextStyle(color: Colors.grey.shade500),),
                    ],)
                  ],
                ),
                // searchbar and create schedule
                Row(
                  children: [
                    // searchbar
                    Container(
                      height: screenHeight * .05,
                      width: screenWidth * .25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * .01),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                            child: const Center(
                              child: Icon(
                                Icons.search, // Search icon
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: screenHeight * .015),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search now...', // Placeholder text
                                  hintStyle: TextStyle(fontSize: fontSize* .9),
                                  border: InputBorder.none, // Remove border
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * .005,),
                    // crate schedule button
                    Container(
                      height: screenHeight * .05,
                      width: screenWidth * .15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenWidth * .01),
                          color: CupertinoColors.systemBlue
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScheduleDialog()));
                          },
                          child: Center(child: Text(Constants.createSchedulebtntext, style: TextStyle(color: Colors.white, fontSize: fontSize * .9),))),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(child: WeeklyCalendar())
        ],
      )
    );
  }
}
