import 'package:flutter/material.dart';
import 'package:raftlabs/utils/customWidgets.dart';

class WelcomeMessage extends StatefulWidget {
  WelcomeMessage({Key? key}) : super(key: key);

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // int hour = now.hour;
    int hour = 9;
    bool ans = false;

    print(ans.toString());
    return Center(
        child: hour >= 0 && hour <= 11
            ? CustomGreetingsColumn(
                imageName: 'assets/gif1.gif',
                greetingName: 'Good Morning',
              )
            : hour >= 12 && hour <= 16
                ? CustomGreetingsColumn(
                    imageName: 'assets/gif2.gif',
                    greetingName: 'Good Afternoon',
                  )
                : CustomGreetingsColumn(
                    imageName: 'assets/gif3.gif',
                    greetingName: 'Good Evening',
                  ));
  }
}
