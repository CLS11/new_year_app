import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:new_year_app/landscape.dart';
import 'package:new_year_app/phases.dart';

import 'test_tools.dart';

void main() {
  testGoldens(
    'Landscape goldens',
    (tester) async {
      configureToLookLikeDevice(tester);

      //ordering the painting

      await tester.pumpWidget(
        _buildLandscape(EnvironmentMode.morning),
      );
      await tester.pumpWidget(
        _buildLandscape(EnvironmentMode.night),
      );
      await tester.pumpWidget(
        _buildLandscape(EnvironmentMode.evening),
      );
      await tester.pumpWidget(
        _buildLandscape(EnvironmentMode.afternoon),
      );
      await screenMatchesGolden(tester, 'landscape_morning');
    },
  );
}

Widget _buildLandscape(EnvironmentMode mode) {
  return const MaterialApp(
    home: Scaffold(
      body: Landscape(
        mode: EnvironmentMode.morning,
      ),
    ),
    debugShowCheckedModeBanner: false,
  );
}
