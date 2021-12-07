import 'dart:convert';

import 'package:halisahacase/model/match_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Matches>> getMatchesData() async {

    final response = await http.get(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/sahavar-1.appspot.com/o/data.json?alt=media'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      Iterable list = result['children'];
      return list.map((coupon) => Matches.fromJson(coupon)).toList();
    } else {
      throw Exception("Failed to get News!!!");
    }
  }
}
