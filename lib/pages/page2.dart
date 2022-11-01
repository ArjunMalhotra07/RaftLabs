import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:raftlabs/utils/customWidgets.dart';

class WelcomeMessage extends StatefulWidget {
  WelcomeMessage({Key? key}) : super(key: key);

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  bool ans = false;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;

    void checkingConnection() async {
      print("Hello");
    }

    @override
    void initState() async {
      ans = await InternetConnectionChecker().hasConnection;
      print(ans);
      super.initState();
    }

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
