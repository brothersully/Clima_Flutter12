import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

String appid = '4f3e6a760c1eeddb2659f16af2366c45';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    Networkhelper networkhelper = Networkhelper(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$appid&units=metric');
    var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentlocation();
    Networkhelper networkhelper = Networkhelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appid&units=metric');
    var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
