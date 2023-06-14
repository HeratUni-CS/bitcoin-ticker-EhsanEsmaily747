

import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper{
  NetworkHelper({required this.url});
  String url;


  Future<dynamic> getData() async{
    Response response=await get(Uri.parse(url));

    if (response.statusCode==200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }
}