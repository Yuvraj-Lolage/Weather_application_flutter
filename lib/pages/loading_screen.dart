import 'package:flutter/material.dart';
import 'package:weather_application/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading..!';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'India',
        flagUrl: 'assets/india.png',
        locationUrl: 'Indian/Chagos');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flagUrl': instance.flagUrl,
      'isDaytime': instance.isDaytime
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: Center(
          child: SpinKitWaveSpinner(
            color: Colors.amber[100] as Color,
            size: 50.0,
          ),
        ));
  }
}
