import 'package:calendar_ui/pages/calendar_page.dart';
import 'package:calendar_ui/pages/create_schedule_page.dart';
import 'package:calendar_ui/pages/widgets/event_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarPage()
    );
  }
}

