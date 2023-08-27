import 'package:flutter/material.dart';
import 'package:weather/bloc/prefs/prefs_bloc.dart';

class Flags extends StatelessWidget {
  const Flags({
    Key? key,
    required this.userBloc,
    required this.isEnglish,
    required this.flag,
  }) : super(key: key);

  final PrefsBloc userBloc;
  final bool isEnglish;
  final String flag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (flag == 'us_flag') {
            userBloc.add(PrefsIdiomEvent(true));
          } else {
            userBloc.add(PrefsIdiomEvent(false));
          }
        },
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                (isEnglish && flag == 'us_flag' || !isEnglish && flag == 'es_flag')
                    ? const BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        spreadRadius: -5,
                        blurRadius: 20,
                        offset: Offset(0, 0),
                      )
                    : const BoxShadow(color: Colors.transparent),
              ],
            ),
            child: Image.asset('assets/images/$flag.png',
                width: (isEnglish && flag == 'us_flag' || !isEnglish && flag == 'es_flag') ? 30 : 22,
                height: (!isEnglish && flag == 'es_flag' || !isEnglish && flag == 'es_flag') ? 30 : 22)),
      ),
    );
  }
}
