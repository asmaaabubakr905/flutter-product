import 'package:flutter/material.dart';

class BuildProductItem extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String category;
  final VoidCallback onAddToCart; 

  const BuildProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.onAddToCart, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Category: $category"),
                  Text("Price: \$${price}"),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onAddToCart,
                    child: const Text("Add to Cart"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

