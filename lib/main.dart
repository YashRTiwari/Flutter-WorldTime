import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/', // For testing purpose
    routes: {
      '/' : (context) => Loading(), // context is used to understand where we are the in widget tree
      '/home': (context) => Home(),
      '/location' : (context) => ChooseLocation()
    },
  ));
}

