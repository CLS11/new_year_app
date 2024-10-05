// ignore_for_file: deprecated_member_use

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void configureToLookLikeDevice(WidgetTester tester){
  tester.binding.window
  ..physicalSizeTestValue = Device.phone.size
  ..devicePixelRatioTestValue = Device.phone.devicePixelRatio;
}