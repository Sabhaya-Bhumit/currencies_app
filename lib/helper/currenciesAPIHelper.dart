import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrenciAPIHelper {
  CurrenciAPIHelper._();
  final Map<String, String> Headers = {
    'X-RapidAPI-Key': 'b3858852dcmsh14446e0f6a5d54dp137ef6jsn32cd8e2a31aa',
    'X-RapidAPI-Host': 'currency-converter-pro1.p.rapidapi.com',
  };

  static final CurrenciAPIHelper currenciAPIHelper = CurrenciAPIHelper._();

  Future<List?> fectdat({required String API}) async {
    // print("bhumit===========");
    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      Map<String, dynamic> jsondata = jsonDecode(res.body);
      print(res.body);
      // Map<String, dynamic> jsondata2 = jsonDecode(res.body);
      List json_list = jsondata['results'].entries.map((e) => e).toList();

      return json_list;
    } else {
      print("api is worng");
    }
  }

  Future<num?> fectdata(
      {required num parm, required String from, required String to}) async {
    Uri uri = Uri.parse(
        "https://currency-converter-pro1.p.rapidapi.com/convert?from=$from&to=$to&amount=$parm");
    http.Response res = await http.get(uri, headers: Headers);

    // print("bhumit==========================");
    if (res.statusCode == 200) {
      Map decodedata = jsonDecode(res.body);
      return decodedata['result'];
    }
  }
}
