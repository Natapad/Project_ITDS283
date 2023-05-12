import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductAppbar extends StatelessWidget {
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_outlined,
            size: 30,
            color: Colors.black,
          ),
          Padding(padding:EdgeInsets.only(left: 20),
          child: Text(
            "VIBES SHOP",
            style: TextStyle(fontSize: 23, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF2c0034),
            ),
            ),
            ),
            Spacer(),
            // Badge(
            //   padding: EdgeInsets.all(6),
        
            //   // child: InkWell(
            //   //   onTap: () {
            //   //     Navigator.push(context, "CartPage" as Route<Object?>);
            //   //   },
            //   //   child: Icon(Icons.message_outlined),
                
                
            //   // ),
            // ),
        ],
      ),
    );
  }
}