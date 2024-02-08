import 'dart:collection';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  var stopwatchTot = Stopwatch();
  var stopwatchLap = Stopwatch();
  String elapsed = '';

  // Button variables
  static const double iconSize = 35;
  static const double buttonHeight = 100;
  static const int buttonFlex = 10;
  static const int buttonMiddleSpaceFlex = 1;

  // Logic variables
  static final arrLapTime = Queue<Duration>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 300,
            width: 400,
            color: const Color.fromARGB(255, 83, 10, 10),
            alignment: Alignment.center,
            child: Text(
              elapsed,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color.fromARGB(255, 34, 82, 87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (stopwatchTot.isRunning) ...[
                  Expanded(
                    flex: buttonFlex,
                    child: SizedBox(
                      height: buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          stopwatchTot.stop();
                          stopwatchLap.stop();
                          setState(() {});
                          /*_onTimerStarted(stopwatch.isRunning, () => setState(() {}));*/
                        },
                        child: const Icon(
                          Icons.pause,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: buttonMiddleSpaceFlex,
                    child: SizedBox(
                      height: 0,
                    ),
                  ),
                  Expanded(
                    flex: buttonFlex,
                    child: SizedBox(
                      height: buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          arrLapTime.add(stopwatchLap.elapsed);
                          stopwatchLap.reset();
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.timer,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    flex: buttonFlex,
                    child: SizedBox(
                      height: buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          stopwatchTot.start();
                          stopwatchLap.start();
                          setState(() {});
                          /*_onTimerStarted(stopwatch.isRunning, () => setState(() {}));*/
                        },
                        child: const Icon(
                          Icons.play_arrow,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: buttonMiddleSpaceFlex,
                    child: SizedBox(
                      height: 0,
                    ),
                  ),
                  Expanded(
                    flex: buttonFlex,
                    child: SizedBox(
                      height: buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          stopwatchTot.reset();
                          stopwatchLap.reset();
                          arrLapTime.clear;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.restore,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*_onTimerStarted(bool isRunning, Function callback) async {
    while (true) {
      callback();

      if (!isRunning) {
        break;
      }

      await Future.delayed(
        const Duration(seconds: 1),
      );
    }
  }*/
}
