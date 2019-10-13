import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_cryptocurrency_app/data/dependency_injection.dart';
import 'HomePage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'data/dependency_injection.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  List _currencies;
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: HomePage(),
    );
  }
}

