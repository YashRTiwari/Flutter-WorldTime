import 'package:flutter/material.dart';
import 'package:world_time/model/WorldDateTimeResponse.dart';
import 'file:///C:/Yash/Flutter/world_time/lib/services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime wt = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time' : wt.time,
      'location' : wt.location,
      'flag' : wt.flag,
      'isDayTime' : wt.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
