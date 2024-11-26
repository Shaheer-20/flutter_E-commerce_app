import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'
    as carousel; // Add alias for carousel_slider
import '../services/product_service.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  final ProductService _productService = ProductService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Commerce App")),
      body: Column(
        children: [
          // Carousel Slider
          carousel.CarouselSlider(
            items: [
              Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fproduct%2F&psig=AOvVaw067E0WSYTVd_IB7Kbypwki&ust=1732722485778000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOCUjLSs-okDFQAAAAAdAAAAABAE',
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50); // Error icon
                },
              ),
              Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fproduct%2F&psig=AOvVaw067E0WSYTVd_IB7Kbypwki&ust=1732722485778000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOCUjLSs-okDFQAAAAAdAAAAABAE',
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50); // Error icon
                },
              ),
              Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fproduct%2F&psig=AOvVaw067E0WSYTVd_IB7Kbypwki&ust=1732722485778000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOCUjLSs-okDFQAAAAAdAAAAABAE',
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50); // Error icon
                },
              ),
            ],
            options: carousel.CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),

          // Categories Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Product Grid with FutureBuilder
          Expanded(
            child: FutureBuilder(
              future: _productService.fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final products = snapshot.data!;
                  if (products.isEmpty) {
                    return const Center(
                      child: Text("No products available."),
                    );
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No data available."),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
