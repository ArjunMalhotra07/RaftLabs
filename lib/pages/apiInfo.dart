import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:raftlabs/models/apiModel.dart';
import 'package:raftlabs/utils/customWidgets.dart';

class FetchDataPage extends StatelessWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(
      height: 10,
    );
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
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: ListView.builder(
                itemCount: incomingDataObjects.length,
                itemBuilder: ((context, index) {
                  final object = incomingDataObjects[index];
                  final apiName = object.api;
                  final desc = object.description;
                  final cors = object.cors;
                  final https = object.https;
                  var num = index + 1;
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          nameText: "$num. API Name",
                        ),
                        box,
                        CustomFormFieldWidget(
                          hintText: apiName.toString(),
                        ),
                        box,
                        CustomText(
                          nameText: "Description",
                        ),
                        box,
                        CustomFormFieldWidget(
                          hintText: desc.toString(),
                        ),
                        box,
                        CustomText(
                          nameText: "Cors",
                        ),
                        box,
                        CustomFormFieldWidget(
                          hintText: cors.toString(),
                        ),
                        box,
                        CustomText(
                          nameText: "Https",
                        ),
                        box,
                        CustomFormFieldWidget(
                          hintText: https.toString(),
                        ),
                        box,
                        const Center(
                            child: Text(
                          "*********************",
                          style: TextStyle(color: Colors.blue),
                        )),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  );
                }),
                scrollDirection: Axis.vertical,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
