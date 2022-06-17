// To parse this JSON data, do
//
//     final weatherResponse = weatherResponseFromMap(jsonString);

import 'dart:convert';

class WeatherResponse {
    WeatherResponse({
        required this.localObservationDateTime,
        required this.epochTime,
        required this.weatherText,
        required this.weatherIcon,
        required this.hasPrecipitation,
        required this.precipitationType,
        required this.isDayTime,
        required this.temperature,
        required this.mobileLink,
        required this.link,
    });

    DateTime localObservationDateTime;
    int epochTime;
    String weatherText;
    int weatherIcon;
    bool hasPrecipitation;
    dynamic precipitationType;
    bool isDayTime;
    Temperature temperature;
    String mobileLink;
    String link;

    factory WeatherResponse.fromJson(String str) => WeatherResponse.fromMap(json.decode(str));
    
    

    factory WeatherResponse.fromMap(Map<String, dynamic> json) => WeatherResponse(
        localObservationDateTime: DateTime.parse(json["LocalObservationDateTime"]),
        epochTime: json["EpochTime"],
        weatherText: json["WeatherText"],
        weatherIcon: json["WeatherIcon"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        isDayTime: json["IsDayTime"],
        temperature: Temperature.fromMap(json["Temperature"]),
        mobileLink: json["MobileLink"],
        link: json["Link"],
    );

    
}

class Temperature {
    Temperature({
        required this.metric,
        required this.imperial,
    });

    Imperial metric;
    Imperial imperial;

    factory Temperature.fromJson(String str) => Temperature.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Temperature.fromMap(Map<String, dynamic> json) => Temperature(
        metric: Imperial.fromMap(json["Metric"]),
        imperial: Imperial.fromMap(json["Imperial"]),
    );

    Map<String, dynamic> toMap() => {
        "Metric": metric.toMap(),
        "Imperial": imperial.toMap(),
    };
}

class Imperial {
    Imperial({
        required this.value,
        required this.unit,
        required this.unitType,
    });

    double value;
    String unit;
    int unitType;

    factory Imperial.fromJson(String str) => Imperial.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Imperial.fromMap(Map<String, dynamic> json) => Imperial(
        value: json["Value"].toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
    );

    Map<String, dynamic> toMap() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
    };
}
