import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const String bitCoinURL = 'https://rest.coinapi.io/v1/exchangerate';
const String apikey = 'ADC05A57-7D59-40D3-931C-A3A170033FE1';

class CoinData {
  CoinData(this.currentCurr);
  double rate = 0;
  String currentCurr;
  String url;
  var info;
  Future getDatafromURL(String currType) async {
    url = '$bitCoinURL/$currType/$currentCurr?apikey=$apikey';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      info = jsonDecode(data);
      return info['rate'];
    } else {
      print(response.statusCode);

      throw 'Problem with get request';
    }
    //double rate = 0;
    // if (info == null)
    //  rate = 0.0;
    // else
    //  rate = info['rate'];

    //return rate.toStringAsFixed(1);
  }
}
