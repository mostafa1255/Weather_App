import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/Cubit/Weather_Cubit/Weather_state.dart';
import 'package:fourth_project/models/weather_model.dart';
import 'package:fourth_project/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.WeatherService) : super(WeatherInitial());
  String? cityName;
  Weathermodel? WeatherData;
  weatherservice WeatherService;
  Weathermodel? weathermodel;
  void getweather({required String cityname}) async {
    emit(WeatherLoading());
    try {
      weathermodel = await WeatherService.getweather(cityname: cityname);
      emit(WeatherSuccsess());
    } catch (e) {
      emit(WeatherFaliure());
    }
  }
}
