import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print("This line is not affected by getData()");
  }

  // void getData() async {
  //   // simulate network request for a username
  //   Future.delayed(Duration(seconds: 3), (){
  //     // Fired when 3 secs are up.
  //     print("Yash");
  //   });
  //
  //   Future.delayed(Duration(seconds: 3), (){ // will be run at the same time above future is ran
  //     // Fired when 3 secs are up.
  //     print("Yash");
  //   });
  // }

  void getData() async {
    // simulate network request for a username
    String result1 = await Future.delayed(Duration(seconds: 1), (){ // await wont run the below code, until this fureu is completed
      // Fired when 3 secs are up.
      return "Yash";
    });
    String result2 = await Future.delayed(Duration(seconds: 1), (){ // will be run at the same time above future is ran
      // Fired when 3 secs are up.
      return "Tiwari";
    });
    print('$result1 $result2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose a Location"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text('$counter'),
      ),
    );
  }
}
