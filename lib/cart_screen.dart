import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Product List'),
        actions: [
          Center(
            child: Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child){
                  return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                },
              ),
              animationDuration: Duration(milliseconds: 300),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),

          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [],
      ),

    );
  }
}
