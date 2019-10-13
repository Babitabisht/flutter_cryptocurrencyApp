import 'package:flutter_cryptocurrency_app/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(
      id: "bitcoin",
      name: "Bitcoin",
      symbol: "BTC",
      rank: "1",
      price_usd: "10033.3954347",
      price_btc: "1.0",
      market_cap_usd: "180111608528",
      available_supply: "17951212.0",
      total_supply: "17951212.0",
      max_supply: "21000000.0",
      percent_change_1h: "0.27",
      percent_change_24h: "-0.14",
      percent_change_7d: "-2.98",
      last_updated: "1569165996"),
  new Crypto(
      id: "aaa",
      name: "dddddddd",
      symbol: "BTC",
      rank: "1",
      price_usd: "10033.3954347",
      price_btc: "1.0",
      market_cap_usd: "180111608528",
      available_supply: "17951212.0",
      total_supply: "17951212.0",
      max_supply: "21000000.0",
      percent_change_1h: "0.27",
      percent_change_24h: "-0.14",
      percent_change_7d: "-2.98",
      last_updated: "1569165996"),
  new Crypto(
      id: "gggggggg",
      name: "vvvvvvvvvvv",
      symbol: "BTC",
      rank: "1",
      price_usd: "10033.3954347",
      price_btc: "1.0",
      market_cap_usd: "180111608528",
      available_supply: "17951212.0",
      total_supply: "17951212.0",
      max_supply: "21000000.0",
      percent_change_1h: "0.27",
      percent_change_24h: "-0.14",
      percent_change_7d: "-2.98",
      last_updated: "1569165996"),
];
