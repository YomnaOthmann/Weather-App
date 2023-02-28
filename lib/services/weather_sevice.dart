import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherModel? weather;
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "6e08ada1860e4b2cba501038231902";
  Future<WeatherModel?> getWeather({
    required String cityName,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
        ),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (error) {
      print(error);
    }
    return weather!;
  }
}
