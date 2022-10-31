import '../models/apiModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class API {
  Future<List<SampleApi>?> getApiDataFunc() async {
    var response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['entries'] as List;
      return data.map((e) => SampleApi.fromJson(e)).toList();
    }
  }

  Future<String?> CheckNetworkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return "connected";
      }
    } on SocketException catch (_) {
      print('not connected');
      return "not connected";
    }
  }
}
