import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalPrice = 1800;

  void updateTotalPrice(int itemPrice, int quantityChange) {
    setState(() {
      totalPrice += itemPrice * quantityChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15.0),
          CartItem(
            itemName: "Shirt",
            itemPrice: 900,
            onUpdateTotalPrice: updateTotalPrice,
          ),
          CartItem(
            itemName: "Shirt",
            itemPrice: 900,
            onUpdateTotalPrice: updateTotalPrice,
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Text(
                "$totalPrice฿",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Spacer(),
          MaterialButton(
            onPressed: () {},
            color: Colors.grey,
            height: 70,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(),
            child: Text(
              "PAY",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String itemName;
  final int itemPrice;
  final Function(int, int) onUpdateTotalPrice;

  const CartItem({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.onUpdateTotalPrice,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  int totalPrice = 0;

  void addItem() {
    setState(() {
      quantity++;
      widget.onUpdateTotalPrice(widget.itemPrice, 1);
      totalPrice += widget.itemPrice;
    });
  }

  void removeItem() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        widget.onUpdateTotalPrice(widget.itemPrice, -1);
        totalPrice -= widget.itemPrice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage("assets/images/1.png"),
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0,
                  child: Text(
                    widget.itemName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.0,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: addItem,
                    ),
                    GestureDetector(
                      onTap: addItem,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        quantity.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: removeItem,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${widget.itemPrice * quantity}฿",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
