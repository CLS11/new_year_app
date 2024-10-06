import 'package:flutter/material.dart';
import 'package:new_year_app/countdown_text.dart';

class HappyNewYearText extends StatefulWidget {
  const HappyNewYearText({
    Key? key,
    this.secondsToNewYear,
  }) : super(key: key);

  final int? secondsToNewYear;

  @override
  _HappyNewYearTextState createState() => _HappyNewYearTextState();
}

class _HappyNewYearTextState extends State<HappyNewYearText>
    with SingleTickerProviderStateMixin {
  late AnimationController _showHappyNewYearController;
  Interval _opacity = Interval(0.0, 0.4);
  Interval _scale = Interval(0.0, 0.5, curve: Curves.elasticOut);
  late int _previousSecondsToNewYear;

  @override
  void initState() {
    super.initState();

    _showHappyNewYearController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _previousSecondsToNewYear = widget.secondsToNewYear!;
    if (_shouldDisplayHappyNewYears()) {
      _showHappyNewYearController.forward();
    }
  }

  @override
  void didUpdateWidget(HappyNewYearText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.secondsToNewYear != _previousSecondsToNewYear) {
      _previousSecondsToNewYear = widget.secondsToNewYear!;
      if (_shouldDisplayHappyNewYears()) {
        _showHappyNewYearController.forward();
      }
    }
  }

  @override
  void dispose() {
    _showHappyNewYearController.dispose();

    super.dispose();
  }

  bool _shouldDisplayHappyNewYears() =>
      widget.secondsToNewYear != null &&
      widget.secondsToNewYear! <= 0 &&
      widget.secondsToNewYear! > -35;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _shouldDisplayHappyNewYears()
          ? Align(
              alignment: Alignment(0.0, -0.35),
              child: Transform.scale(
                scale: _scale.transform(_showHappyNewYearController.value),
                child: Opacity(
                  opacity:
                      _opacity.transform(_showHappyNewYearController.value),
                  child: const Text(
                    'HAPPY\nNEW\nYEAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
