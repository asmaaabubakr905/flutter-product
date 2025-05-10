import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.network(item.thumbnail, width: 50, height: 50),
            title: Text(item.title),
            subtitle: Text("\$${item.price}"),
          );
        },
      ),
    );
  }
}
