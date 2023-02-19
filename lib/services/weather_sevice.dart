import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "6e08ada1860e4b2cba501038231902";
  Future<WeatherModel> getWeather({
    required String cityName,
  }) async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
      ),
    );

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
