class Crypto {
  final String id;
  final String name;
  final String symbol;
  final String rank;
  final String price_usd;
  final String price_btc;
  final String volume_usd;
  final String market_cap_usd;
  final String available_supply;
  final String total_supply;
  final String max_supply;
  final String percent_change_1h;
  final String percent_change_24h;
  final String percent_change_7d;
  final String last_updated;

  Crypto({ 
    this.id,
    this.name,
    this.symbol,
    this.rank,
    this.price_usd,
    this.price_btc,
    this.volume_usd,
    this.market_cap_usd,
    this.available_supply,
    this.total_supply,
    this.max_supply,
    this.percent_change_1h,
    this.percent_change_24h,
    this.percent_change_7d,
    this.last_updated,
  });

Crypto.fromMap(Map<String, dynamic> map):
    id = map['id'],
    name= map['name'],
    symbol= map['symbol'],
    rank= map['rank'],
    price_usd= map['price_usd'],
    price_btc= map['price_btc'],
    volume_usd= map['volume_usd'],
    market_cap_usd= map['market_cap_usd'],
    available_supply= map['available_supply'],
    total_supply= map['total_supply'],
    max_supply= map['max_supply'],
    percent_change_1h= map['percent_change_1h'],
    percent_change_24h= map['percent_change_24h'],
    percent_change_7d= map['percent_change_7d'],
    last_updated= map['last_updated'];


}



abstract class CryptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);
  String toString() {
    return _message == null ? "Exception" : "Exception: $_message";
  }
}
