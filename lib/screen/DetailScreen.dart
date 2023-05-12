import 'package:flutter/material.dart';
import 'package:vibesshoppp/screen/ProductsPage.dart';
import 'package:vibesshoppp/service/api.dart';

class DetailScreen extends StatelessWidget {
  final Api api;

  const DetailScreen({required this.api});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(api.nameTshirt),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.50),
            child: Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                api.imageTshirt,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  api.nameTshirt,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  api.priceTshirt,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  api.descriptionSht,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
