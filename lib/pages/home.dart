import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String background =
        data['isDaytime'] ? 'assets/day.jpg' : 'assets/night.jpg';
    Color textColor = !data['isDaytime']
        ? const Color.fromARGB(255, 232, 232, 232)
        : const Color.fromARGB(255, 18, 18, 18);

    String message = data['isDaytime'] ? 'Good Morning..🌤️' : 'Good Night..🌙';
    Color color = data['isDaytime']
        ? const Color.fromARGB(255, 94, 47, 0)
        : const Color.fromARGB(255, 255, 255, 255);

    Color navigationcolor = !data['isDaytime']
        ? const Color.fromARGB(255, 10, 71, 92)
        : const Color.fromARGB(255, 18, 85, 102);

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
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/locations');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flagUrl': result['flagUrl'],
                            'isDaytime': result['isDaytime']
                          };
                        });
                      },
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
                height: 20,
              ),
              Text(
                data['time'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(68, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                height: 250,
                child: Text(
                  message,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: color),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: navigationcolor,
        items: const <Widget>[
          Icon(Icons.watch_later, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.location_on, size: 30),
        ],
        onTap: (index) async {
          if (index == 2) {
            print('Your in Contacts page');
            dynamic result = await Navigator.pushNamed(context, '/locations');
            setState(() {
              data = {
                'time': result['time'],
                'location': result['location'],
                'flagUrl': result['flagUrl'],
                'isDaytime': result['isDaytime']
              };
            });
          }
        },
      ),
    );
  }
}
