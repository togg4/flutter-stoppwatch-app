import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final stopwatch = Stopwatch();
  String elapsed = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 300,
            width: 400,
            color: Colors.black54,
            alignment: Alignment.center,
            child: Text(
              elapsed,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          if (stopwatch.isRunning)
            ElevatedButton(
              onPressed: () {
                stopwatch.stop();
                setState(() {});
              },
              child: const Icon(
                Icons.pause,
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    stopwatch.reset();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.restore,
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    stopwatch.start();
                    setState(() {});
                    /*_onTimerStarted(stopwatch.isRunning, () => setState(() {}));*/
                  },
                  child: const Icon(
                    Icons.play_arrow,
                  ),
                ),
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
