// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cryptocurrency_app/data/crypto_data.dart';

// class Crypto {
//   final String id;
//   final String name;
//   final String symbol;
//   final String rank;
//   final String price_usd;
//   final String price_btc;
//   final String volume_usd;
//   final String market_cap_usd;
//   final String available_supply;
//   final String total_supply;
//   final String max_supply;
//   final String percent_change_1h;
//   final String percent_change_24h;
//   final String percent_change_7d;
//   final String last_updated;

//   Crypto(
//     this.id,
//     this.name,
//     this.symbol,
//     this.rank,
//     this.price_usd,
//     this.price_btc,
//     this.volume_usd,
//     this.market_cap_usd,
//     this.available_supply,
//     this.total_supply,
//     this.max_supply,
//     this.percent_change_1h,
//     this.percent_change_24h,
//     this.percent_change_7d,
//     this.last_updated,
//   );
// }

class CryptoInfo extends StatelessWidget {
  final BuildContext context;
  Crypto crypto;

  CryptoInfo(this.context, this.crypto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto Info"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            new Center(
              child: new Text(
                crypto.name,
                style: new TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            new Text(
              "Id  :     " + crypto.id + "\n",
              style: new TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0),
            ),
            new Text("symbol  :     " + crypto.symbol + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text("rank  :     " + crypto.rank + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text("price_usd  :     " + crypto.price_usd + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),

            new Text("market_cap_usd  :     " + crypto.market_cap_usd + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text(
                "available_supply  :     " + crypto.available_supply + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text("total_supply  :     " + crypto.total_supply + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text(
                "percent_change_1h  :     " + crypto.percent_change_1h + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text(
                "percent_change_24h  :     " + crypto.percent_change_24h + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text(
                "percent_change_7d  :     " + crypto.percent_change_7d + "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            new Text(
                "last_updated  :     " +
                    (new DateTime.fromMillisecondsSinceEpoch(
                            int.parse(crypto.last_updated) * 1000))
                        .toString() +
                    "\n",
                style: new TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            // new MaterialButton(
            //   color: Colors.indigo,
            //   child: new Text("see in date format"),
            //   textColor: Colors.white,
            //   onPressed: () => {
            //     print(new DateTime.fromMillisecondsSinceEpoch(
            //         int.parse(crypto["last_updated"]) * 1000))

            //   },
            // )
          ],
        ),
      ),
    );
  }
}
