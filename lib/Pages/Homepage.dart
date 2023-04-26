import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/Cubit/Weather_Cubit/Weather_Cubit.dart';
import 'package:fourth_project/Cubit/Weather_Cubit/Weather_state.dart';
import 'package:fourth_project/Pages/search_page.dart';
import 'package:fourth_project/models/weather_model.dart';
import 'package:fourth_project/models/weather_providers.dart';
import 'package:provider/provider.dart';

import 'Widgets/Default_Body.dart';

class homepage extends StatelessWidget {
  Weathermodel? weatherdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Searchpage();
                }));
              },
              icon: const Icon(Icons.search),
            )
          ],
          title: const Text('Weather App'),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccsess) {
            weatherdata = BlocProvider.of<WeatherCubit>(context).weathermodel;
            return SuccsessBody(
              weatherdata: weatherdata,
            );
          } else if (state is WeatherFaliure) {
            return const Center(child: Text("No data Write Naw"));
          } else {
            return const defultBody();
          }
        }));
  }
}

class SuccsessBody extends StatelessWidget {
  SuccsessBody({super.key, this.weatherdata});
  Weathermodel? weatherdata;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
      weatherdata!.getThemeColor(),
      weatherdata!.getThemeColor()[50]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            "Updated at : ${weatherdata!.date.hour.toString()}:${weatherdata!.date.minute.toString()}",
            style: const TextStyle(fontSize: 15),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherdata!.getImage()),
              Text(
                weatherdata!.temp.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              Column(
                children: [
                  Text('maxtemp : ${weatherdata!.maxTemp}'),
                  Text('maxtemp : ${weatherdata!.minTemp}')
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            weatherdata?.weatherStateName ?? 'no Weather',
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
