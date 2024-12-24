import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../constants/constans.dart';

class CreateScheduleDialog extends StatefulWidget {
  const CreateScheduleDialog({Key? key}) : super(key: key);

  @override
  State<CreateScheduleDialog> createState() => _CreateScheduleDialogState();
}

class _CreateScheduleDialogState extends State<CreateScheduleDialog> {
  String? _selectedValue;
  List<String> _items = ['Audience 1', 'Audience 2', 'Audience 3'];
  Color _selectedColor = Colors.blue; // Default color
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth * 0.015;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      contentPadding: EdgeInsets.all(screenWidth * 0.03),
      content: SizedBox(
        width: screenWidth * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                        ),
                        child: Image.asset(
                          Constants.calendarPlusIcon,
                          height: screenWidth * .03,
                        )),
                    SizedBox(width: screenWidth * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Constants.createSchedulebtntext,
                          style: TextStyle(
                              fontSize: fontSize * 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Fill in the data below to add a schedule',
                          style:
                              TextStyle(fontSize: fontSize, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: screenWidth * 0.05),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            const Divider(),
            SizedBox(height: screenHeight * 0.02),

            Row(
              children: [
                Text(
                  'Mark Schedule',
                  style: TextStyle(
                      fontSize: fontSize * 1.2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: screenWidth * 0.02),
            // Audience and Color Picker Row
            Row(
              children: [
                // Audience Dropdown
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01),
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.05,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.01),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedValue,
                            hint: const Text('Select Audience'),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            },
                            items: _items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),

                // Color Picker
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => _showColorPickerDialog(),
                    child: Container(
                      height: screenHeight * 0.05,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      decoration: BoxDecoration(
                        // color: _selectedColor,
                        borderRadius: BorderRadius.circular(screenWidth * 0.01),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              height: screenHeight * 0.04,
                              width: screenHeight * .04,
                              decoration: BoxDecoration(
                                color: _selectedColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.01),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              '#${_selectedColor.value.toRadixString(16).substring(2).toUpperCase()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Text(
                  'Title Schedule',
                  style: TextStyle(
                      fontSize: fontSize * 1.2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: screenWidth * 0.02),
            // Title Schedule Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Title Schedule',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.01)),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Text(
                  'Date & Time',
                  style: TextStyle(
                      fontSize: fontSize * 1.2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: screenWidth * 0.02),
            // Date and Time Pickers
            Row(
              children: [
                // Date Picker
                Expanded(
                  child: GestureDetector(
                    onTap: _selectDate,
                    child: Container(
                      height: screenHeight * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.01),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        _selectedDate != null
                            ? "${_selectedDate!.toLocal()}".split(' ')[0]
                            : "Select Date",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),

                // Time Picker
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTime(true),
                    child: Container(
                      height: screenHeight * 0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.01),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        _startTime != null
                            ? _startTime!.format(context)
                            : "Start Time",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue, width: 1.5),
                    // Border styling
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Button padding
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                ElevatedButton(
                  onPressed: () {
                    // Handle submission
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Button padding
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color tempColor = _selectedColor;
        return AlertDialog(
          title: const Text('Pick a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              onColorChanged: (Color color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue, width: 1.5),
                // Border styling
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Button padding
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue, // Text color
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedColor = tempColor;
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Button padding
              ),
              child: const Text(
                'select',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
