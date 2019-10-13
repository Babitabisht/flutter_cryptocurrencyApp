import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cryptocurrency_app/CryptoInfo.dart';
import 'package:flutter_cryptocurrency_app/data/crypto_data.dart';
import 'package:flutter_cryptocurrency_app/modules/crypto_presenter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> currencies;
  bool _isLoading;

  final List<MaterialColor> _colors = [
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.blueGrey
  ];

  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadCurrencies();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cryptocurrency"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: _isLoading
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Crypto currency = currencies[index];
              final MaterialColor _color = _colors[index % _colors.length];
              return _getListItemUI(currency, _color);
            },
          ),
        ),
      ],
    ));
  }

  ListTile _getListItemUI(Crypto currency, MaterialColor color) {
    // AlertDialog alert =

    return new ListTile(
        leading: new CircleAvatar(
          backgroundColor: color,
          child: new Text(currency.name[0]),
        ),
        title: new Text(
          currency.name,
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle:
            _getSubtitleText(currency.price_usd, currency.percent_change_24h),
        isThreeLine: true,
        onLongPress: () => showDialog(
            context: context,
            child: new AlertDialog(
                content: new Column(
              children: <Widget>[
                new Text(
                  "ID : " + currency.id,
                  style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                new Text(
                  "Name : " + currency.name,
                ),
                new Text(
                  "Rank : " + currency.rank,
                ),
                new Text(
                  "price_usd : " + currency.price_usd,
                ),
                new Text(
                  "price_btc : " + currency.price_btc,
                ),
                new Text(
                  "market_cap_usd : " + currency.market_cap_usd,
                ),
                new Text(
                  "available_supply : " + currency.available_supply,
                ),
                new Text(
                  "total_supply : " + currency.total_supply,
                ),
                new Text(
                  "max_supply : " + currency.max_supply,
                ),
                new Text(
                  "percent_change_1h : " + currency.percent_change_1h,
                ),
                new Text(
                  "percent_change_24h : " + currency.percent_change_24h,
                ),
                new Text(
                  "percent_change_7d : " + currency.percent_change_7d,
                ),
                new Text(
                  "last_updated : " + currency.last_updated,
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

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComplete
    setState(() {
      currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
