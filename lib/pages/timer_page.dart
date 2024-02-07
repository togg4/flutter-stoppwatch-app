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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (stopwatch.isRunning) ...[
                SizedBox(
                  width: 150,
                  height: 100,
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
                const SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  height: 100,
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
              ] else ...[
                SizedBox(
                  width: 150,
                  height: 100,
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
                const SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  height: 100,
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
                )
              ]
            ],
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
