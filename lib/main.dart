import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'HomePage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  List _currencies;
  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.pink,
      primaryColor: defaultTargetPlatform ==  TargetPlatform.iOS? Colors.grey[100]:null
      ),
      home: HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
  final String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
