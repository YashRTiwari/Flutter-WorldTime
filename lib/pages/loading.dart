import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
      Response data = await http.get('https://jsonplaceholder.typicode.com/todos/1');
      print(data.body); // .body returns string.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading"),
    );
  }
}
