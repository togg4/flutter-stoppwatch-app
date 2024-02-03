import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.title, required this.child});

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(title),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
