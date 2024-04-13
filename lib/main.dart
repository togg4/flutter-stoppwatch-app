import 'package:flutter/material.dart';
import 'package:timer_app/base_layout.dart';
import 'package:timer_app/pages/stopwatch_page.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
  primaryColor: Colors.blue,
  brightness: Brightness.dark,
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: theme,
      darkTheme: theme,
      themeMode: ThemeMode.dark,
      home: const BaseLayout(
        title: 'Timer App',
        child: StopWatchPage(),
      ),
    );
  }
}
