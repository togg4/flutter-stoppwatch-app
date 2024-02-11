import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final Stopwatch _stopwatchTot = Stopwatch();
  final Stopwatch _stopwatchLap = Stopwatch();
  // Duration? _elapsed;

  // Button variables
  static const double iconSize = 35;
  static const double buttonHeight = 100;
  static const int buttonFlex = 10;
  static const int buttonMiddleSpaceFlex = 1;

  // Logic variables
  static final arrLapTime = Queue<Duration>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String timeFormatingMS(Duration _elapsed) {
    /// Formatting time according to "Hours : Minutes : Seconds"
    /// where each time unit is given with two digits
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (_elapsed.inMinutes < 60) {
      return '${twoDigits(_elapsed.inMinutes % 60)}:${twoDigits(_elapsed.inSeconds % 60)}';
    } else {
      return "60:59";
    }
  }

  String timeFormatingHMS(Duration _elapsed) {
    /// Formatting time according to "Hours : Minutes : Seconds"
    /// where each time unit is given with two digits
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (_elapsed.inHours < 100) {
      return '${twoDigits(_elapsed.inMinutes % 60)}:${twoDigits(_elapsed.inSeconds % 60)}';
    } else {
      return "99:59:59";
    }
  }

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
              timeFormatingMS(_stopwatchLap.elapsed),
              style: const TextStyle(
                fontSize: 100,
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
                if (_stopwatchTot.isRunning) ...[
                  Expanded(
                    flex: buttonFlex,
                    child: SizedBox(
                      height: buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _stopwatchTot.stop();
                          _stopwatchLap.stop();
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
                          arrLapTime.add(_stopwatchLap.elapsed);
                          _stopwatchLap.reset();
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
                          _stopwatchTot.start();
                          _stopwatchLap.start();
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                            setState(() {});
                          });
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
                          _stopwatchTot.reset();
                          _stopwatchLap.reset();
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
