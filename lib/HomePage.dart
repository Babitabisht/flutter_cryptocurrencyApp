import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cryptocurrency_app/CryptoInfo.dart';

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
    // AlertDialog alert =

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
        onLongPress: () => showDialog(
            context: context,
            child: new AlertDialog(
                content: new Column(
              children: <Widget>[
                new Text(
                  "ID : " + currency["id"],
                  style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                new Text(
                  "Name : " + currency["name"],
                ),
                new Text(
                  "Rank : " + currency["rank"],
                ),
                new Text(
                  "price_usd : " + currency["price_usd"],
                ),
                new Text(
                  "price_btc : " + currency["price_btc"],
                ),
                new Text(
                  "24h_volume_usd : " + currency["24h_volume_usd"],
                ),
                new Text(
                  "market_cap_usd : " + currency["market_cap_usd"],
                ),
                new Text(
                  "available_supply : " + currency["available_supply"],
                ),
                new Text(
                  "total_supply : " + currency["total_supply"],
                ),
                new Text(
                  "max_supply : " + currency["max_supply"],
                ),
                new Text(
                  "percent_change_1h : " + currency["percent_change_1h"],
                ),
                new Text(
                  "percent_change_24h : " + currency["percent_change_24h"],
                ),
                new Text(
                  "percent_change_7d : " + currency["percent_change_7d"],
                ),
                new Text(
                  "last_updated : " + currency["last_updated"],
                ),
              ],
            ))),
        onTap: () => {
              // Navigator.of(context).pop(),
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new CryptoInfo(context, currency)))
            });
  }

  Widget _getSubtitleText(String priceUsd, String priceChange) {
    TextSpan priceTxt = new TextSpan(
        text: "\$$priceUsd", style: new TextStyle(color: Colors.blueAccent));
    String percentageChanged = "  24 hour percentage change $priceChange";
    TextSpan percentageChangeWidget;
    if (double.parse(priceChange) > 0) {
      percentageChangeWidget = new TextSpan(
          text: percentageChanged,
          style: new TextStyle(color: Colors.green[800]));
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
