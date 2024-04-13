// import 'dart:async';
import 'dart:collection';
// import 'dart:async';

// import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage>
    with SingleTickerProviderStateMixin {
  final Stopwatch _stopwatch = Stopwatch();
  // final Duration _elapsedLap = Duration.zero;
  String lapTimeStr = "00:00:00";

  // Button variables
  static const double iconSize = 35;
  static const double buttonHeight = 100;
  static const int buttonFlex = 10;
  static const int buttonMiddleSpaceFlex = 1;

  // Logic variables
  static final arrLapTime = Queue<Duration>();
  // late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _updateDisplay();
  }

  void _updateDisplay() {
    setState() {
      int hours = _stopwatch.elapsed.inHours;
      int minutes = _stopwatch.elapsed.inMinutes;
      int seconds = _stopwatch.elapsed.inSeconds;
      lapTimeStr =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  void lapResetDispose() {
    dispose();
    _stopwatch.reset();
  }

  void pauseDispose() {
    dispose();
    _stopwatch.stop();
  }

  String timeFormatingMS(Duration elapsed) {
    /// Formatting time according to "Hours : Minutes : Seconds"
    /// where each time unit is given with two digits
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (elapsed.inMinutes < 60) {
      return '${twoDigits(elapsed.inMinutes % 60)}:${twoDigits(elapsed.inSeconds % 60)}';
    } else {
      return "60:59";
    }
  }

  String timeFormatingHMS(Duration elapsed) {
    /// Formatting time according to "Hours : Minutes : Seconds"
    /// where each time unit is given with two digits
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (elapsed.inHours < 100) {
      return '${twoDigits(elapsed.inMinutes % 60)}:${twoDigits(elapsed.inSeconds % 60)}';
    } else {
      return "99:59:59";
    }
  }

  double lapTimeFontSize(double screenWidth) {
    /// Finding the font size of the lap Time
    /// that fills out the available space with
    return 150 / 432 * screenWidth;
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
              lapTimeStr,
              style: TextStyle(
                fontSize: lapTimeFontSize(MediaQuery.of(context).size.width),
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
                if (_stopwatch.isRunning) ...[
                  Expanded(
                    flex: buttonFlex,
                    child: SizedBox(
                      height: buttonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _stopwatch.stop();
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
                          arrLapTime.add(_stopwatch.elapsed);
                          _stopwatch.reset();
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
                          _stopwatch.start();
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
                          _stopwatch.reset();
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
