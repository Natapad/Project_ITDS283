import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  //...
  Future<List<Api>> getData() async {
    final response = await http
        .get(Uri.parse('https://api-1.phumipattomyim.repl.co/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Api.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
  //...
}

Api apiFromJson(String str) => Api.fromJson(json.decode(str));

String apiToJson(Api data) => json.encode(data.toJson());

class Api {
    Api({
        required this.nameTshirt,
        required this.imageTshirt,
        required this.priceTshirt,
        required this.descriptionSht,
    });

    String nameTshirt;
    String imageTshirt;
    String priceTshirt;
    String descriptionSht;

    factory Api.fromJson(Map<String, dynamic> json) => Api(
        nameTshirt: json["name_tshirt"],
        imageTshirt: json["image_tshirt"],
        priceTshirt: json["price_tshirt"],
        descriptionSht: json["description_sht"],
    );

    Map<String, dynamic> toJson() => {
        "name_tshirt": nameTshirt,
        "image_tshirt": imageTshirt,
        "price_tshirt": priceTshirt,
        "description_sht": descriptionSht,
    };
}






