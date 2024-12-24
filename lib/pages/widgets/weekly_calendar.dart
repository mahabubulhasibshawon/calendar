import 'package:flutter/material.dart';

class WeeklyCalendar extends StatelessWidget {
  final List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<String> timeSlots = [
    '',
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
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

    // Get the current week's dates
    DateTime now = DateTime.now();
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday % 7));
    List<DateTime> weekDates = List.generate(7, (index) => firstDayOfWeek.add(Duration(days: index)));

    return Container(
      margin: EdgeInsets.all(screenWidth * .02),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildHeaderRow(weekDates, calHeight, calWidth),
          Expanded(
            child: _buildCalendarGrid(calHeight, calWidth),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(List<DateTime> weekDates, calHeight, calWidth) {
    return Row(
      children: [
        Container(
          width: calWidth / 13,
          height: calHeight /10,
          alignment: Alignment.center,
          child: const Text(
            'GMT+7',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...weekDates.map((date) {
          return Expanded(
            child: Container(
              height: calHeight /10 ,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayOfWeek(date), // Day (e.g., Sun)
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _getDate(date), // Date (e.g., 24)
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getDate(DateTime date) {
    return date.day.toString(); // Return day of the month (e.g., 24)
  }

  Widget _buildCalendarGrid(calHeight, calWidth) {
    return Column(
      children: timeSlots.map((time) {
        return Row(
          children: [
            // Time Column
            Container(
              width: calWidth / 13,
              height: calHeight /10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade500
                )
              ),
              child: Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Calendar Cells for Days
            ...List.generate(7, (index) {
              return Expanded(
                child: Container(
                  height: calHeight /10,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    // borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ],
        );
      }).toList(),
    );
  }
}
