import 'package:flutter/material.dart';

class CountdownText extends StatefulWidget {
  const CountdownText({required this.secondsToNewYear, super.key});
  final int secondsToNewYear;
  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText>
    with SingleTickerProviderStateMixin {
  late AnimationController _showNumberController;
  final Interval _opacity = const Interval(0.0, 0.4);
  final Interval _scale = const Interval(0.0, 0.5, curve: Curves.elasticOut);
  late int _displayNumber;

  @override
  void initState() {
    super.initState();

    _showNumberController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..addListener(() {
        setState(() {});
      });

    _displayNumber = widget.secondsToNewYear;
    if (_isCountingDown()) {
      _showNumberController.forward();
    }
  }

  @override
  void didUpdateWidget(CountdownText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.secondsToNewYear != _displayNumber) {
      _displayNumber = widget.secondsToNewYear;
      if (_isCountingDown()) {
        _showNumberController.forward(from: 0.0);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _showNumberController.dispose();
  }

  bool _isCountingDown() =>
      widget.secondsToNewYear == null &&
      (widget.secondsToNewYear <= 9 && widget.secondsToNewYear > 0);

  @override
  Widget build(BuildContext context) {
    if (!_isCountingDown()) {
      return const SizedBox();
    }
    return Align(
      alignment: const Alignment(0.0, -0.3),
      child: Transform.scale(
        scale: _scale.transform(_showNumberController.value),
        child: Opacity(
          opacity: _opacity.transform(_showNumberController.value),
          child: Text(
            '${widget.secondsToNewYear}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 240,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
