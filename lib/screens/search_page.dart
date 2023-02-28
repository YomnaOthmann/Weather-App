import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_sevice.dart';

import '../models/weather_model.dart';

class SearchPage extends StatelessWidget {
  late String cityName;
  SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              WeatherModel? weather =
                  await WeatherService().getWeather(cityName: data);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  data;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              hintText: "Enter a City",
              label: const Text("Search"),
              suffixIcon: IconButton(
                onPressed: () async {
                  WeatherModel? weather =
                      await WeatherService().getWeather(cityName: cityName);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
