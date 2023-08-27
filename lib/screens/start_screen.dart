import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInRight(
              delay: const Duration(seconds: 1),
              duration: const Duration(seconds: 1),
              child: Text('Weather Forecast 2.0', style: GoogleFonts.notoSans(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600))),
          const SizedBox(height: 50),
          BounceInDown(
              delay: const Duration(seconds: 0),
              duration: const Duration(seconds: 2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/img_weather.png', width: 200, height: 200),
              ))
        ],
      ),
    );
  }
}
