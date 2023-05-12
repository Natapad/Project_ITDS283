import 'package:flutter/material.dart';
import 'package:vibesshoppp/screen/CartPage.dart';
import 'package:vibesshoppp/service/api.dart';
import 'screen/HomePage.dart';
import 'screen/LoginPage.dart';
import 'screen/RegisterPage.dart';
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
