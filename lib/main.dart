import 'package:flutter/material.dart';
import 'package:new_year_app/countdown_screen.dart';

void main() {
  runApp(const NewYearApp());
}

class NewYearApp extends StatelessWidget {
  const NewYearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy New Year',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewYearsCountdownScreen(
        overrideStartDateTime: DateTime.parse('2024-12-31 23:59:51'),
        doTick: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
