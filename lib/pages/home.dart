import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String background =
        data['isDaytime'] ? 'assets/day.jpg' : 'assets/night.jpg';
    Color textColor = !data['isDaytime']
        ? const Color.fromARGB(255, 232, 232, 232)
        : const Color.fromARGB(255, 18, 18, 18);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.white70,
                      ),
                      label: Text(
                        data['location'],
                        style: TextStyle(fontSize: 28.0, color: textColor),
                      ))
                ],
              ),
              const SizedBox(height: 60.0),
              CircleAvatar(
                  radius: 100.0, backgroundImage: AssetImage(data['flagUrl'])),
              const SizedBox(
                height: 60,
              ),
              Text(
                data['time'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
