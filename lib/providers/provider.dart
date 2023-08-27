import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/bloc/prefs/prefs_bloc.dart';
import 'package:weather/models/wheather.dart';

Future<void> fetchWeatherData(city, PrefsBloc userBloc) async {
  String apikey = '9d285c6652c46d59e969a828a0523715';
  String urlBase = 'api.openweathermap.org';

  String lang = (userBloc.state.isEnglish!) ? 'en' : 'es';

  final url = Uri.https(urlBase, '/data/2.5/forecast', {'q': city, 'cnt': '1', 'units': 'metric', 'lang': lang, 'appid': apikey});
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final weatherData = WheatherModel.fromJson(jsonData);

      userBloc.add(PrefsModelEvent(weatherData));
    } else {
      throw Exception('Failed to load weather data');
    }
  } catch (e) {
    throw Exception('Failed to fetch weather data: $e');
  }
}
