import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flag/flag.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'CN'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'JP'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'KR'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'FR'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'GB'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'DE'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'KE'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'US'),
  ];

  void updateTime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context, {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDaytime': wt.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: Flags.getMiniFlag(locations[index].flag, null, 44),
            ),
          );
        },
      ),
    );
  }
}
