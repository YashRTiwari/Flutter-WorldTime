import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; // Empty Map



  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; // Doesn't require setState since, before rendering data is received.

    return Scaffold(
      backgroundColor: data["isDayTime"] ? Colors.white : Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result["time"],
                        'location' : result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag']
                      };
                    });
                  }, icon: Icon(Icons.edit_location),
                  label: Text("Edit Location")),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Text(
                data["time"],
                style: TextStyle(
                  fontSize: 60,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
