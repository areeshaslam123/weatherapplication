import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WeatherApi {
  static const baseUrl = 'http://api.openweathermap.org/data/2.5/weather';
  static const apiKey = '09a7a33b33d1e82facecdd9df1a0fef1';

  static Future<dynamic> getWeather(String city) async {
    var url = '$baseUrl?q=$city&appid=$apiKey&units=metric';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
