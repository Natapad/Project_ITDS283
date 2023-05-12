import 'package:flutter/material.dart';
import 'package:vibesshoppp/search.dart';
import 'ProductsPage.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Image.asset("assets/images/Logo.png"),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Image.asset("assets/images/1.png"),
          ),
          const Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "UP TO 45% OFF!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "20-28 MAR",
            style: TextStyle(color: Color.fromARGB(255, 1, 76, 1)),
          ),


          // Tap Space
          const Spacer(),

          // Button Get Start
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    child: const Text(
                      'GET START',
                      style: TextStyle(
                        color: Color.fromARGB(255, 254, 255, 255),
                        fontWeight: FontWeight.w900,
                        fontSize: 42,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Color.fromARGB(255, 64, 2, 102), // Background color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ApiPage();
                        }),
                      );
                    },
                  )),
                  
                  
            ],
          ),
        ],
      ),
    );
  }
}
