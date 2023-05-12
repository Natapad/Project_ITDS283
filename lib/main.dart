import 'package:flutter/material.dart';
import 'package:vibesshoppp/screen/CartPage.dart';
import 'screen/HomePage.dart';
import 'screen/LoginPage.dart';
import 'screen/RegisterPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIBES SHOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //  "/" :(context) => HomePage(),
      //  "cartpage":(context) => CartPage(),
      // },
      home: HomePage(),
    );
  }
}


