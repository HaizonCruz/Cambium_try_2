import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearProgress extends StatefulWidget {
  const LinearProgress({super.key});

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  double _progress = 0;
bool isRunning = false;

  @override
  void initState() {
    isRunning = true;
    startTimer();
    super.initState();
  }

  void startTimer() {
    Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer timer) => setState(
        () {
          if ((_progress + 0.02) <= 1) {
            _progress += 0.02;
          } else {
            _progress = 0.02;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          lineHeight: 25.0,
          percent: _progress,
          barRadius: const Radius.circular(20),
          progressColor: Colors.black38,
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: const Text('Speed Test in progress, please wait')),
        Container(
            alignment: const Alignment(0, 0),
            margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _progress = 0;
                  });
                  if(!isRunning) {
                    isRunning = !isRunning;
                    startTimer();
                  }
                },
                child: const Text('Start Progress Bar')))
      ],
    );
  }
}
