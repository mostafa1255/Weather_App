import 'package:flutter/cupertino.dart';
import 'package:fourth_project/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weathermodel? weatherdata;
  String? CityName;
  set WeatherData(Weathermodel? weather) {
    weatherdata = weather;
    notifyListeners();
  }

  Weathermodel? get WeatherData {
    return weatherdata!;
  }

}
