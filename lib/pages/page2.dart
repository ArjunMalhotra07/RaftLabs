import 'package:flutter/material.dart';

class WelcomeMessage extends StatefulWidget {
  WelcomeMessage({Key? key}) : super(key: key);

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    print(now.hour);
    return Center(
      child: hour >= 0 && hour <= 11
          ? const Text("Good Morning")
          : hour >= 12 && hour <= 16
              ? const Text("Good Afternoon")
              : const Text("Good Evening"),
    );
  }
}
