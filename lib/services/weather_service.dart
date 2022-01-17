import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://www.metaweather.com';

  Future<int> getCityId({required String cityName}) async {
    try {
      Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
      http.Response response = await http.get(url); // response = result
      //انا مش هعرف اهندل السترينج بحوله ل جيسون عشان اعرف اتعامل معاه
      List<dynamic> data = jsonDecode(response.body);
      return data[0]['woeid']; //city id
    } catch (e) {
      print(e.toString());
    }
    return 0;
  }

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    int cityId = await getCityId(cityName: cityName);
    WeatherModel weatherModel;
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/api/location/$cityId/',
      ),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    Map<String, dynamic> myData = data['consolidated_weather'][0];
    weatherModel = WeatherModel.fromJson(myData);
    return weatherModel;
  }
}
