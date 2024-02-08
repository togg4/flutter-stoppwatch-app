import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  var stopwatch = Stopwatch();
  String elapsed = '';
  static const double iconSize = 35;
  static const double buttonHeight = 100;
  static const int buttonFlex = 10;
  static const int buttonMiddleSpaceFlex = 1;
  static const int buttonSideSpaceFlex = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 300,
            width: 400,
            color: Colors.black87,
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
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (stopwatch.isRunning) ...[
                  const Expanded(
                    flex: buttonSideSpaceFlex,
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
                          stopwatch.stop();
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
                          stopwatch.reset();
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.timer,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: buttonSideSpaceFlex,
                    child: SizedBox(
                      height: 0,
                    ),
                  ),
                ] else ...[
                  const Expanded(
                    flex: buttonSideSpaceFlex,
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
                          stopwatch.start();
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
                          stopwatch.reset();
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.restore,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: buttonSideSpaceFlex,
                    child: SizedBox(
                      height: 0,
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
