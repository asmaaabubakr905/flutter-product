import 'package:flutter/material.dart';
import 'package:my_app/build_product_item.dart';
import 'package:my_app/dio/api_provider.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/screens/cart_screen.dart'; 

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ProductModel? producstUi;
  List<Product> cartItems = [];

  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
  }

  Future<void> getProductsFromApiProvider() async {
    producstUi = await ApiProvider().getAllProductsFromApi();
    setState(() {});
    print("=======UI ${producstUi!.products[0].title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              producstUi == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: producstUi!.products.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        final product = producstUi!.products[index];
                        return BuildProductItem(
                          name: product.title,
                          image: product.thumbnail,
                          price: product.price.toString(),
                          category: product.category,
                          onAddToCart: () {
                            setState(() {
                              cartItems.add(product);
                            });
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartScreen(cartItems: cartItems),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
