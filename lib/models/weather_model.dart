import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['current']['last_updated'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  String getImage() {
    if (weatherStateName == "Sunny") {
      return 'assets/images/day/113.png';
    } else if (weatherStateName == 'Partly cloudy') {
      return 'assets/images/day/116.png';
    } else if (weatherStateName == 'Cloudy') {
      return 'assets/images/day/119.png';
    } else if (weatherStateName == 'Overcast') {
      return 'assets/images/day/122.png';
    } else if (weatherStateName == 'Mist') {
      return 'assets/images/day/143.png';
    } else if (weatherStateName == "Blowing snow") {
      return 'assets/images/day/227.png';
    } else if (weatherStateName == 'Fog') {
      return 'assets/images/day/248.png';
    } else if (weatherStateName.contains("rain")) {
      return 'assets/images/day/308.png';
    } else if (weatherStateName.contains('snow')) {
      return 'assets/images/day/338.png';
    } else if (weatherStateName.contains("thunder")) {
      return 'assets/images/day/386.png';
    } else {
      return 'assets/images/day/113.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName.contains("Sunny")) {
      return Colors.orange;
    } else if (weatherStateName.contains('cloudy')) {
      return Colors.grey;
    } else if (weatherStateName == 'Overcast') {
      return Colors.grey;
    } else if (weatherStateName.contains("snow")) {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName.contains('rain')) {
      return Colors.blue;
    } else if (weatherStateName.contains("thunder")) {
      return Colors.blueGrey;
    } else {
      return Colors.blue;
    }
  }
}
