import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:raftlabs/models/apiModel.dart';

class FetchDataPage extends StatelessWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<SampleApi>?> getApiDataFunc() async {
      var response =
          await http.get(Uri.parse('https://api.publicapis.org/entries'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['entries'] as List;
        return data.map((e) => SampleApi.fromJson(e)).toList();
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data'),
      ),
      body: FutureBuilder(
        future: getApiDataFunc(),
        builder: (context, data) {
          if (data.hasError) {
            return const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                    child:
                        Text("Oops. Something went wrong. Try again later!")));
          } else if (data.hasData) {
            var incomingDataObjects = data.data as List<SampleApi>;
            return ListView.builder(
              itemCount: incomingDataObjects.length,
              itemBuilder: ((context, index) {
                final object = incomingDataObjects[index];
                final apiName = object.api;
                final desc = object.description;
                final cors = object.cors;
                final https = object.https;
                return Container(
                  child: Column(
                    children: [
                      Text(apiName.toString()),
                      Text(desc.toString()),
                      Text(cors.toString()),
                      Text(https.toString()),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                );
              }),
              scrollDirection: Axis.vertical,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
