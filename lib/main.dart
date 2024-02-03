import 'package:flutter/material.dart';
import 'package:timer_app/pages/timer_page.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const TimerPage(title: 'Flutter Demo Home Page'),
    );
  }
}
