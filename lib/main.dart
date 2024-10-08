import 'package:flutter/material.dart';
import 'package:weather_application/pages/choose_location.dart';
import 'package:weather_application/pages/home.dart';
import 'package:weather_application/pages/loading_screen.dart';

void main() => runApp(MaterialApp(
      // initialRoute:
      //     '/locations', // used to specify which route used at initial state
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/locations': (context) => const ChooseLocation()
      },
    ));
