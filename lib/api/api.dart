import 'dart:convert';
import 'package:http/http.dart';
import 'package:covid19/model/model.dart';

class RestClient {
  final String baseUrl;

  RestClient({
    this.baseUrl = 'https://corona.lmao.ninja',
  });

  Future<Total> getAll() async {
    final Response res = await get(this.baseUrl + '/all');

    if (res.statusCode == 200) {
      return Total.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load all');
    }
  }

  Future<List<Country>> getCountries() async {
    final Response res = await get(this.baseUrl + '/countries');

    if (res.statusCode == 200) {
      return ((json.decode(res.body) ?? []) as List).map((j) {
        return Country.fromJson(j);
      }).toList();
    } else {
      throw Exception('Failed to load all');
    }
  }
}
