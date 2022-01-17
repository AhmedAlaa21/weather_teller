import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  String? _cityName;

  set weatherData(WeatherModel? weatherModel) {
    _weatherModel = weatherModel;
    notifyListeners();
  }

  WeatherModel? get getWeather => _weatherModel;

  set setCityName(String cityName) {
    _cityName = cityName;
  }

  String? get getCityName => _cityName;
}
