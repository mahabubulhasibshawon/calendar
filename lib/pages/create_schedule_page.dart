import 'package:calendar_ui/constants/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateSchedulePage extends StatefulWidget {
  const CreateSchedulePage({super.key});

  @override
  State<CreateSchedulePage> createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  String? _selectedValue;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // fontsize
    final double fontSize = screenWidth * .015;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenHeight * .015),
        child: Column(
          children: [
            // create schedule section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //   icon
                      Container(
                          padding: EdgeInsets.all(screenWidth * .01),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(screenWidth * .02)
                          ),
                          child: Image.asset(Constants.calendarPlusIcon, height: screenWidth * .03,)),
                      //   title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Constants.createSchedulebtntext, style: TextStyle(fontSize: fontSize * 1.5, fontWeight: FontWeight.bold),),
                            Text('Fill in the data below to add a schedule', style: TextStyle(fontSize: fontSize, color: Colors.grey),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //   exit
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.xmark, size: screenWidth * .03,)),
                ],
              ),
            ),
            SizedBox(height: screenHeight * .01,),
            Divider(),
            SizedBox(height: screenHeight * .01,),
            // DropdownButton(items: audienceList.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(), onChanged: (val) {}),
            Row(
            //   Audience
              children: [
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
                          child: DropdownButton(value: _selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            },
                            items: _items.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
