import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:raftlabs/models/apiModel.dart';

class FetchDataPage extends StatelessWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<SampleApi>> getBatchers() async {
      final response =
          await http.get(Uri.parse('https://api.publicapis.org/entries'));
      print('Get Batchers page players : ${response.body}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        print('Players --- >  : ${json.decode(response.body)['entries']}');

        return data.map((e) => SampleApi.fromJson(e)).toList();
      } else {
        throw Exception('${response.statusCode}');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data'),
      ),
      body: FutureBuilder(
        // future: fetchLeaderBoardData(),
        future: getBatchers(),
        builder: (context, data) {
          if (data.hasError) {
            return const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                    child:
                        Text("Oops. Something went wrong. Try again later!")));
          } else if (data.hasData) {
            var playersData = data.data as List<SampleApi>;
            return Stack(
              children: [
                // waveBackground,
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          final object = playersData[index];
                          final apiName = object.api;
                          final desc = object.description;
                          final cors = object.cors;
                          final https = object.https;
                          return Container();
                        }),
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
