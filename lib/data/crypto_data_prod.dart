import 'package:flutter_cryptocurrency_app/data/crypto_data.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdCryptoRepository implements CryptoRepository {
  final String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    // TODO: implement fetchCurrencies
    http.Response response = await http.get(url);

    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
          "an error ocuured : [Status Code : $statusCode]");
    }

    return responseBody.map((c) => Crypto.fromMap(c)).toList();
  }
}
