import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';

//TODO save weather data locally
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).getWeather == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).getWeather!.getThemeColor(),
      ),
      initialRoute: HomeScreen.screenRoute,
      routes: {
        HomeScreen.screenRoute: (ctx) => const HomeScreen(),
        SearchScreen.screenRoute: (ctx) => const SearchScreen(),
      },
    );
  }
}
