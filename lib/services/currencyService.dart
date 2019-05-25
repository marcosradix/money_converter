
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const REQUEST_API = "https://api.hgbrasil.com/finance/quotations?format=json&key=c0d69cea";

class CurrencyService {

 Future<Map>  getCurrencies() async {
   http.Response response = await http.get(REQUEST_API);
  return json.decode( response.body );
}

}