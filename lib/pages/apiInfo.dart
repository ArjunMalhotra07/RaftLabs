import 'package:flutter/material.dart';
import 'package:raftlabs/models/apiModel.dart';
import 'package:raftlabs/utils/api.dart';
import 'package:raftlabs/utils/customWidgets.dart';

class FetchDataPage extends StatelessWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(
      height: 10,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data'),
      ),
      body: FutureBuilder(
        future: API().getApiDataFunc(),
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
