import 'package:flutter/material.dart';

enum EnvironmentMode {
  morning,
  afternoon,
  evening,
  night,
}

const nightGradient = LinearGradient(
  colors: [
    Color(0xFF19142a),
    Color(0xFF3f2b87),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const nightTextColor = const Color(0xFF3C148C);

const morningGradient = LinearGradient(
  colors: [
    Color(0xFFFAE81C),
    Colors.white,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const morningTextColor = const Color(0xFF797149);

const afternoonGradient = LinearGradient(
  colors: [
    Color(0xFF0D71F9),
    Colors.white,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const afternoonTextColor = const Color(0xFF5E576C);

const eveningGradient = LinearGradient(
  colors: [
    Color(0xFFBC3100),
    Color(0xFFE04F08),
    Color(0xFFFF8A00),
    Color(0xFFFFC888),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const eveningTextColor = const Color(0xFF832A2A);
