import 'dart:convert';
import 'dart:io';

import 'package:mobile_dev/models/pizza.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = '6r4zr.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      List<Pizza> pizzas = jsonResponse.map<Pizza>((json) => Pizza.fromJson(json)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const String path = '/pizza';
    String body = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, path);
    http.Response response = await http.post(url, body: body);
    return response.body;
  }
}