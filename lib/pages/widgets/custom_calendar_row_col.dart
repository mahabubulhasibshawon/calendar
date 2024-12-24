import 'package:flutter/material.dart';

class CustomCalendarRowCol extends StatelessWidget {
  final DateTime currentDate = DateTime.now();
  final List<String> daysOfWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // fontsize
    final double fontSize = screenWidth * .015;
    // set size for calendar
    final double calHeight = screenHeight * .8;
    final double calWidth = screenWidth * .9;
    return Container(
      height: calHeight,
      width: calWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: daysOfWeek
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: screenHeight * .01,),

        ],
      ),
    );
  }
  Widget _buildDaysGrid () {
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;
    int startingWeekday = firstDayOfMonth.weekday % 7;

    List<Row> rows = [];
    List<Widget> currentRow = [];

  //   fill empty slots before first day of the month
    return Column();
  }
}
