import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/Cubit/Weather_Cubit/Weather_Cubit.dart';
import 'package:fourth_project/models/weather_model.dart';
import 'package:fourth_project/models/weather_providers.dart';
import 'package:fourth_project/service/weather_service.dart';
import 'package:provider/provider.dart';

class Searchpage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getweather(cityname: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                label: Text('Search'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      weatherservice service = weatherservice();
                      Weathermodel? weather =
                          await service.getweather(cityname: cityName!);
                      BlocProvider.of<WeatherCubit>(context, listen: false)
                          .WeatherData = weather;
                      BlocProvider.of<WeatherCubit>(context, listen: false)
                          .cityName = cityName;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(),
                hintText: 'Enter city name'),
          ),
        ),
      ),
    );
  }
}
