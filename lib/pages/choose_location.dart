import 'package:flutter/material.dart';
import 'package:weather_application/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Indonesia',
        flagUrl: 'indo.png',
        locationUrl: 'Asia/Jakarta'),
    WorldTime(
        location: 'India', flagUrl: 'india.png', locationUrl: 'Indian/Chagos'),
    WorldTime(
        location: 'America',
        flagUrl: 'america.png',
        locationUrl: 'America/New_York'),
    WorldTime(
        location: 'Australia',
        flagUrl: 'australia.png',
        locationUrl: 'Australia/Melbourne'),
    WorldTime(
        location: 'Australia',
        flagUrl: 'australia.png',
        locationUrl: 'Australia/Sydney'),
  ];
  @override
  void initState() {
    super.initState();
  }

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flagUrl': instance.flagUrl,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Location'),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flagUrl}')),
                  onTap: () {
                    // print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          },
        ));
  }
}
