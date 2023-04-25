import 'dart:convert';
import 'package:fourth_project/models/weather_model.dart';
import 'package:http/http.dart' as http;

class weatherservice {
  Weathermodel? model;
  Future<Weathermodel?> getweather({required String cityname}) async {
    try {
      String apikey = '58025a4573b34285b57133601231602';
      String baseurl = 'http://api.weatherapi.com/v1';
      Uri url =
          Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname&aqi=no');

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      model = Weathermodel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return model;
  }
}
