import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/providers/provider.dart';
import 'package:weather/bloc/prefs/prefs_bloc.dart';

import 'package:weather/screens/start_screen.dart';
import 'package:weather/screens/tab_bar_screen.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (context) => PrefsBloc())],
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);

    _controller.addListener(() {
      setState(() {
        handleTabSelection();
      });
    });
  }

  void handleTabSelection() async {
    final userBloc = BlocProvider.of<PrefsBloc>(context, listen: false);
    if (_controller.index != 3) {
      try {
        await fetchWeatherData(
            (_controller.index == 0)
                ? 'Londres'
                : (_controller.index == 1)
                    ? 'Toronto'
                    : (_controller.index == 2)
                        ? 'Singapur'
                        : 'Contacto',
            userBloc);
      } catch (e) {
        throw Exception('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<PrefsBloc>(context, listen: true);
    final isEnglish = userBloc.state.isEnglish;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Weather Forecast'),
            actions: [
              Flags(userBloc: userBloc, isEnglish: isEnglish!, flag: 'us_flag'),
              Flags(userBloc: userBloc, isEnglish: isEnglish, flag: 'es_flag'),
            ],
          ),
          body: BlocBuilder<PrefsBloc, PrefsState>(
            builder: (context, state) {
              return state.wheatherModel == null ? const StartScreen() : TapBarScreen(weatherBloc: userBloc.state.wheatherModel, isEnglish: isEnglish, controller: _controller);
            },
          ),
          //,
          bottomNavigationBar: BottomTabBar(_controller, isEnglish: isEnglish),
        ),
      ),
    );
  }
}
