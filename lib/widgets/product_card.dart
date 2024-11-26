import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.name),
          ),
          Text("\$${product.price.toString()}"),
          ElevatedButton(
            onPressed: () {
              // Add to Cart functionality
            },
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
