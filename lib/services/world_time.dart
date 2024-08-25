import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for UI
  late String time; // time to location
  late String flagUrl; //url to flag icon
  late String locationUrl; // dynamic location url for api endpoint
  late bool isDaytime;

  WorldTime(
      {required this.location,
      required this.flagUrl,
      required this.locationUrl});

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$locationUrl'));

      Map data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        //get properties from data
        String datetime = data['datetime'];
        String offset =
            data['utc_offset'].substring(1, 3); //(1,6) for further minutes

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
        //set property ['time'] from the data
        time = DateFormat.jm().format(now);
      } else {
        print('Error 404');
        time = 'could not get time..';
      }
    } catch (e) {
      print('caught error: $e');
    }
  }
}
