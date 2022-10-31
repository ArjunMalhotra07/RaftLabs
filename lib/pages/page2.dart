import 'package:flutter/material.dart';
import 'package:raftlabs/utils/api.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

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
    bool ans = false;
    void checkingNetwork() async {
      // ans = await InternetConnectionChecker().hasConnection;
    }

    @override
    void initState() {
      super.initState();
      checkingNetwork();
    }

    print(ans.toString());
    return Center(
        child: hour >= 0 && hour <= 11
            ? const Text("Good Morning")
            : hour >= 12 && hour <= 16
                ? Column(
                    children: [
                      Image.asset(
                        'assets/gif1.gif',
                        height: 125.0,
                        width: 125.0,
                      ),
                      const Text("Good Afternoon"),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gif2.gif',
                        height: 300.0,
                        width: 300.0,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Good Evening",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ));
  }
}
