import 'package:flutter/material.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime currentDate = DateTime.now();
  final List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDaysOfWeekRow(),
                Expanded(child: _buildDaysGrid(constraints)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDaysOfWeekRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: daysOfWeek
          .map((day) => Text(
        day,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ))
          .toList(),
    );
  }

  Widget _buildDaysGrid(BoxConstraints constraints) {
    // Get the first day of the month
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);

    // Get the total number of days in the month
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

    // Get the starting weekday (0 = Sunday, 6 = Saturday)
    int startingWeekday = firstDayOfMonth.weekday % 7;

    // Total number of grid items including blank spaces
    int totalItems = startingWeekday + daysInMonth;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: constraints.maxWidth > 600 ? 7 : 4,
      ),
      itemCount: totalItems,
      itemBuilder: (context, index) {
        if (index < startingWeekday) {
          // Empty space before the first day of the month
          return const SizedBox.shrink();
        }

        // Calculate the day number
        int dayNumber = index - startingWeekday + 1;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            color: currentDate.day == dayNumber ? Colors.blueAccent : Colors.white,
          ),
          child: Center(
            child: Text(
              dayNumber.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: currentDate.day == dayNumber ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
