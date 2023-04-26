import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/Cubit/Weather_Cubit/Weather_Cubit.dart';
import 'package:fourth_project/Pages/Homepage.dart';
import 'package:fourth_project/models/weather_providers.dart';
import 'package:fourth_project/service/weather_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit(weatherservice());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            //   primarySwatch:
            /*    Provider.of<WeatherProvider>(context).weatherdata == null
                    ? Colors.blue
                    : Provider.of<WeatherProvider>(context)
                        .weatherdata!
                        .getThemeColor()
                        */
            ),
        debugShowCheckedModeBanner: false,
        home: homepage());
  }
}
