import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weather/functions/functions.dart';
import 'package:weather/models/wheather.dart';
import 'package:weather/widgets/image_flag_widget.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key, required this.weatherBloc, required this.isEnglish}) : super(key: key);

  final WheatherModel? weatherBloc;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    final temp = weatherBloc?.list[0].main.temp;
    final tempMax = weatherBloc?.list[0].main.tempMax;
    final tempMin = weatherBloc?.list[0].main.tempMin;
    final description = weatherBloc?.list[0].weather[0].description;
    final icoUrl = 'https://openweathermap.org/img/wn/${weatherBloc?.list[0].weather[0].icon}.png';

    var country = weatherBloc?.city.name;
    switch (country) {
      case 'London':
        country = (!isEnglish) ? 'Londres' : 'London';
        break;
      case 'Singapore':
        country = (!isEnglish) ? 'Singapur' : 'Singapore';
        break;
    }

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(children: [
                  Positioned(left: 0, child: Text('$temp°C', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400))),
                  Positioned(
                      right: 0,
                      child: Column(
                        children: [
                          Text('Max: $tempMax°C', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                          Text('Min: $tempMin°C', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                        ],
                      )),
                  FadeInDown(duration: const Duration(seconds: 2), child: Center(child: ImageFromUrl(icoUrl))),
                  Image.asset('assets/images/city.png', width: double.infinity, height: 300),
                ]),
                const SizedBox(height: 16.0),
                Text((isEnglish) ? 'Weather in $country' : 'Tiempo en $country', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8.0),
                Text(capitalizeFirstLetter(description!)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
