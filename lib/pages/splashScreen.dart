import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:receipnesia/pages/loginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/cooking.png',
                height: 100,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/img/resepnesia.png',
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          backgroundColor: const Color(0xFF66757F),
          nextScreen: const loginScreen(),
          splashIconSize: 250,
          duration: 2500,
          splashTransition: SplashTransition.fadeTransition,
        ));
  }
}
