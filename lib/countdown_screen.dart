import 'package:flutter/material.dart';
import 'package:new_year_app/landscape.dart';
import 'package:new_year_app/phases.dart';

class NewYearsCountdownScreen extends StatelessWidget {
  const NewYearsCountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Landscape(
        mode: EnvironmentMode.night,
        time: '8:40 PM',
        year: '2021',
      ),
    );
  }
}
