import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<dynamic>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/products'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to fetch products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
