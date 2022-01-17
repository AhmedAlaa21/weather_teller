import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'search_screen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(
      context,
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Search a City',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 15,
                  ),
                  suffixIcon: const Icon(Icons.search),
                  label: const Text('Search'),
                  hintText: 'Enter City Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      // color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),
                onSubmitted: (value) async {
                  provider.weatherData =
                      await WeatherService().getWeatherData(cityName: value);
                  provider.setCityName = value;
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
