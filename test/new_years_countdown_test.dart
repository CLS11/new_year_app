import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:new_year_app/countdown_screen.dart';
import 'package:new_year_app/countdown_text.dart';
import 'package:new_year_app/hny_text.dart';

import 'test_tools.dart';

Future<void> main() async {
  await loadAppFonts();

  testGoldens('new years countdown goldens', (tester) async {
    configureToLookLikeDevice(tester);

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:50')),
    );
    await screenMatchesGolden(tester, '10_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:51')),
    );
    await screenMatchesGolden(tester, '9_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:52')),
    );
    await screenMatchesGolden(tester, '8_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:53')),
    );
    await screenMatchesGolden(tester, '7_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:54')),
    );
    await screenMatchesGolden(tester, '6_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:55')),
    );
    await screenMatchesGolden(tester, '5_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:56')),
    );
    await screenMatchesGolden(tester, '4_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:57')),
    );
    await screenMatchesGolden(tester, '3_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:58')),
    );
    await screenMatchesGolden(tester, '2_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-12-31 23:59:59')),
    );
    await screenMatchesGolden(tester, '1_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2024-01-01 00:00:00')),
    );
    await screenMatchesGolden(tester, 'happy_new_year');
  });
}

Widget _screenForDateTime(DateTime time) {
  return MaterialApp(
    home: NewYearsCountdownScreen(
      overrideStartDateTime: time,
      doTick: false,
    ),
    debugShowCheckedModeBanner: false,
  );
}
