import 'package:flutter/material.dart';
import 'package:new_year_app/landscape.dart';
import 'package:new_year_app/phases.dart';
import 'package:intl/intl.dart';
import 'package:new_year_app/time_lapse.dart';

class NewYearCountdownPage extends StatefulWidget {
  const NewYearCountdownPage({required this.currentTime, super.key});
  final DateTime currentTime;

  @override
  State<NewYearCountdownPage> createState() => _NewYearCountdownPageState();
}

class _NewYearCountdownPageState extends State<NewYearCountdownPage> {
  final DateFormat _timeFormat = DateFormat('hh:mm:ss a');
  @override
  Widget build(BuildContext context) {
    return Landscape(
      mode: _buildEnvironmentMode(),
      time: _timeFormat.format(widget.currentTime),
      year: '${widget.currentTime.year}',
    );
  }

  EnvironmentMode _buildEnvironmentMode() {
    final hours = widget.currentTime.hour;
    if (hours >= 6 && hours < 11) {
      return EnvironmentMode.morning;
    } else if (hours >= 11 && hours < 15) {
      return EnvironmentMode.afternoon;
    } else if (hours >= 15 && hours <= 18) {
      return EnvironmentMode.evening;
    } else {
      return EnvironmentMode.night;
    }
  }
}
