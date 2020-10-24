import 'dart:convert';

import 'package:http/http.dart' as http;

class Nasa {
  Future getnasa() async {
    String url =
        "https://api.nasa.gov/planetary/apod?api_key=0bxrz4QvcgiCbhNKuVVhdDyPSGv7J8CBf1vhui6B"; // link of the json file
    var response = await http.get(url, headers: {"accept": "application/json"});
    var data = json.decode(response
        .body); //no use of data if there is no  data backward of [] array
    return data;
  }
}
