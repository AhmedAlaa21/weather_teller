import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'home_screen';

  @override
  Widget build(BuildContext context) {
    WeatherModel? model = Provider.of<WeatherProvider>(context).getWeather;
    String? cityName = Provider.of<WeatherProvider>(context).getCityName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, SearchScreen.screenRoute),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: model == null || cityName == null
          ? noWeatherData()
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    model.getThemeColor(),
                    model.getThemeColor()[50]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    cityName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated ${model.applicableDate}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(model.getImage()),
                      Text(
                        model.theTemp.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'min: ${model.minTemp.toInt()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'max: ${model.maxTemp.toInt()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    model.weatherStateName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }

  Widget noWeatherData() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
