import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  String applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;

  WeatherModel({
    required this.weatherStateName,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> myData) {
    return WeatherModel(
      applicableDate: myData['applicable_date'],
      maxTemp: myData['max_temp'],
      minTemp: myData['min_temp'],
      theTemp: myData['the_temp'],
      weatherStateName: myData['weather_state_name'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/thunderstorm.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.green;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.orange;
    } else {
      return Colors.yellow;
    }
  }
}
