import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_year_app/countdown_text.dart';
import 'package:new_year_app/hny_text.dart';
import 'package:new_year_app/landscape.dart';
import 'package:new_year_app/phases.dart';

class NewYearCountdownPage extends StatefulWidget {
  const NewYearCountdownPage({required this.currentTime, super.key});
  final DateTime currentTime;

  @override
  State<NewYearCountdownPage> createState() => _NewYearCountdownPageState();
}

class _NewYearCountdownPageState extends State<NewYearCountdownPage>
    with SingleTickerProviderStateMixin {
  final DateFormat _timeFormat = DateFormat('hh:mm:ss a');
  final DateTime _newYearDateTime = DateTime.parse('2025-01-01 00:00:00');
  final List<ConfettiController> _fireworksController = [];
  final List<DateTime> _fireworksStartTime = [];
  final List<Alignment> _fireworksAlignments = [];
  Timer? _generateMoreFireworksTimer;

  late AnimationController _mountainFlashController;

  @override 
  void initState() {
    _mountainFlashController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(
        () {
          setState() {}
        },
      );
    super.initState();
  }

  @override
  void didUpdateWidget(NewYearCountdownPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentTime.year != widget.currentTime.year) {
      _doFireworks();
    }
  }

  @override
  void dispose() {
    _generateMoreFireworksTimer?.cancel();
    _mountainFlashController.dispose();

    for (final controller in _fireworksController) {
      controller.dispose();
    }

    super.dispose();
  }

  Future<void> _doFireworks() async {
    //Adding new fireworks controller
    if (_fireworksController.length < 25) {
      final newController =
          ConfettiController(duration: const Duration(milliseconds: 1000))
            ..play();
      _fireworksController.add(newController);
      _fireworksStartTime.add(DateTime.now());

      final random = Random();
      final alignHorizontal = (random.nextDouble() * 2.0) - 1.0;
      final alignVertical = (random.nextDouble() * -0.5) - 0.5;
      _fireworksAlignments.add(Alignment(alignHorizontal, alignVertical));

      _mountainFlashController.reverse(from: 1.0);

      if (mounted) {
        final randomTime = Random().nextInt(2000);
        _generateMoreFireworksTimer =
            Timer(Duration(milliseconds: randomTime), () {
          if (mounted) {
            _doFireworks();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final secondsUntilNewYear =
        (_newYearDateTime.difference(widget.currentTime).inMilliseconds / 1000)
            .ceil();
    return Stack(
      children: [
        Landscape(
          mode: _buildEnvironmentMode(),
          fireworks: _buildFireworks(),
          flashPercent: _mountainFlashController.value,
          time: _timeFormat.format(widget.currentTime),
          year: '${widget.currentTime.year}',
        ),
        CountdownText(
          secondsToNewYear: secondsUntilNewYear,
        ),
        HappyNewYearText(secondsToNewYear: secondsUntilNewYear),
      ],
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

  Widget _buildFireworks() {
    final availableColors = [Colors.yellow, Colors.red, Colors.blue];
    final colorIndex = Random().nextInt(3);
    final color = availableColors[colorIndex];

    final fireworks = <Widget>[];
    for (var i = 0; i < _fireworksController.length; ++i) {
      fireworks.add(
        Align(
          alignment: _fireworksAlignments[i],
          child: ConfettiWidget(
            confettiController: _fireworksController[i],
            displayTarget: true,
            blastDirectionality: BlastDirectionality.explosive,
            blastDirection: 2 * pi,
            colors: [color],
            minimumSize: const Size(1, 1),
            maximumSize: const Size(5, 5),
            minBlastForce: 0.001,
            maxBlastForce: 0.0011,
            gravity: 0.1,
            particleDrag: 0.1,
            numberOfParticles: 35,
            emissionFrequency: 0.00000001,
            shouldLoop: false,
          ),
        ),
      );
    }

    return Stack(
      children: fireworks,
    );
  }
}
