import 'package:flutter/material.dart';
import 'package:raftlabs/pages/apiInfo.dart';

class FetchData extends StatefulWidget {
  FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FetchDataPage()),
          );
        },
        child: const Text('Fetch Data'),
      ),
    );
  }
}
