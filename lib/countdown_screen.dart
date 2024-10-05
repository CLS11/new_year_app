import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_year_app/countdown_page.dart';
import 'package:new_year_app/landscape.dart';
import 'package:new_year_app/phases.dart';
import 'package:new_year_app/time_lapse.dart';

class NewYearsCountdownScreen extends StatelessWidget {
  NewYearsCountdownScreen(
      {required this.overrideStartDateTime, required this.doTick, super.key});

  
  final DateTime overrideStartDateTime;
  final bool doTick;
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      body: TimeLapse(
        overrideStartDateTime: overrideStartDateTime,
        doTick: doTick,
        dateTimeBuilder: (DateTime currentTime) {
          return NewYearCountdownPage(
            currentTime: currentTime,
          );
        },
      ),
    );
  }
}
