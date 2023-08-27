import 'package:flutter/material.dart';
import 'package:weather/models/wheather.dart';
import 'package:weather/screens/country_screen.dart';
import 'package:weather/widgets/contact_form_widget.dart';

class TapBarScreen extends StatelessWidget {
  const TapBarScreen({Key? key, required this.weatherBloc, required this.isEnglish, required this.controller}) : super(key: key);

  final WheatherModel? weatherBloc;
  final bool isEnglish;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        CountryScreen(weatherBloc: weatherBloc, isEnglish: isEnglish),
        CountryScreen(weatherBloc: weatherBloc, isEnglish: isEnglish),
        CountryScreen(weatherBloc: weatherBloc, isEnglish: isEnglish),
        ContactForm(isEnglish: isEnglish)
      ],
    );
  }
}
