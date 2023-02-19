import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_sevice.dart';

import '../models/weather_model.dart';

WeatherModel? weatherData;

class SearchPage extends StatelessWidget {
  late String cityName;

  VoidCallback? updateUi;
  SearchPage({this.updateUi});
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
            onSubmitted: (data) async {
              WeatherModel weather =
                  await WeatherService().getWeather(cityName: data);
              weatherData = weather;
              updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              hintText: "Enter a City",
              label: const Text("Search"),
              suffixIcon: IconButton(
                onPressed: () {},
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
