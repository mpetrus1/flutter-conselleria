import 'package:flutter/material.dart';
import 'package:projecte_final/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    String iconNumber = weatherProvider.icon >= 10? weatherProvider.icon.toString() : '0' + weatherProvider.icon.toString();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather conditions in Menorca'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Date and time of observation:\n ${weatherProvider.observationTime}',
              style: TextStyle(fontSize:28),
            ),
            Text(
              weatherProvider.weatherConditions,
              style: TextStyle(fontSize: 32),
            ),
            Text(
              'Temperature: ${weatherProvider.temp}ºC',
              style: TextStyle(fontSize: 32),

            
            ),
            Image.network(
               'https://developer.accuweather.com/sites/default/files/'+'$iconNumber'+'-s.png',
               width: 200,
               height: 120,
               fit:BoxFit.fill),
          ],
        ));
  }
}
