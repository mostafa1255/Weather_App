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
              icon: Icon(Icons.search),
            )
          ],
          title: Text('Weather App'),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccsess) {
            weatherdata = BlocProvider.of<WeatherCubit>(context).weathermodel;
            return succsessBody(context);
          } else if (state is WeatherFaliure) {
            return Center(child: Text("No data Write Naw"));
          } else {
            return defultBody();
          }
        }));
  }

  Container succsessBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        BlocProvider.of<WeatherCubit>(context).WeatherData!.getThemeColor(),
        Provider.of<WeatherProvider>(context)
            .weatherdata!
            .getThemeColor()[200]!,
        BlocProvider.of<WeatherCubit>(context).WeatherData!.getThemeColor()[50]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName.toString(),
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            'Updated at : ${weatherdata!.date.hour.toString()}:${weatherdata!.date.minute.toString()}',
            style: TextStyle(fontSize: 15),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherdata!.getImage()!),
              Text(
                weatherdata!.temp.toString(),
                style: TextStyle(fontSize: 40),
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
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}

class defultBody extends StatelessWidget {
  const defultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'There is no weater yet ',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            ' searching Now',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
