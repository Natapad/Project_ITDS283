import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  'assets/images/Logo.png',
                  height: 300,
                  width: 440,
                ),

                const SizedBox(height: 100),
                
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(0),
                        child: ElevatedButton(
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: Colors.black, // Background color
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }),
                            );
                          },
                        )),
                  ],
                ),

                const SizedBox(height: 60),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 155.0),
                  child: Row(
                    children: [

                    ],
                  ),
                ),

                const SizedBox(height: 1),

                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 100, right: 100,bottom: 200),
                        child: ElevatedButton(
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: Colors.black, // Background color
                          ),
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                        }
                      ));
                          
                          },
                        )),
                  ],
                ),
              ])),
        ));
  }
}