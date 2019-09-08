import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List currencies;
  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> _colors = [
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.blueGrey
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cryptocurrency app"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Map currency = widget.currencies[index];
              final MaterialColor _color = _colors[index % _colors.length];
              return _getListItemUI(currency, _color);
            },
          ),
        ),
      ],
    ));
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency["name"][0]),
      ),
      title: new Text(
        currency["name"],
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
          currency["price_usd"], currency["percent_change_24h"]),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUsd, String priceChange) {
    TextSpan priceTxt = new TextSpan(
        text: "\$$priceUsd", style: new TextStyle(color: Colors.blueAccent));
    String percentageChanged = "  24 hour percentage change $priceChange";
    TextSpan percentageChangeWidget;
    if (double.parse(priceChange) > 0) {
      percentageChangeWidget = new TextSpan(
          text: percentageChanged, style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeWidget = new TextSpan(
          text: percentageChanged, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(children: [
      priceTxt,
      TextSpan(text: '\n'),
      percentageChangeWidget
    ]));
  }
}
