
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/models.dart';
import '../models/movie.dart';


class WeatherProvider extends ChangeNotifier{
String _baseUrl='dataservice.accuweather.com';
String _apiKey='BzWaJcjfSy8mRfnZNdE6GfFrDwAG7h0J';
String _language ='en-US';
String _cityKey='305476';

String temp='';
String weatherConditions='';
String observationTime='';
int icon = 0;

WeatherProvider(){
  this.getWeather();
}

  getWeather() async {
    var url = Uri.https(_baseUrl, 'currentconditions/v1/305482', {
      'apikey': _apiKey,
      });

    // Await the http get response, then decode the json-formatted response.
    
    final result = await http.get(url);


    final weatherResponse = WeatherResponse.fromJson(result.body.replaceAll("[", "").replaceAll("]", ""));


    temp = weatherResponse.temperature.metric.value.toString();
    weatherConditions = weatherResponse.weatherText.toString();
    observationTime = weatherResponse.localObservationDateTime.toString();
    icon = weatherResponse.weatherIcon;
    
    
    notifyListeners();

  }

}
