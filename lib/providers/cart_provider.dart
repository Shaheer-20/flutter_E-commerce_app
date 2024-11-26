import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<String> _cartItems = [];

  List<String> get cartItems => _cartItems;

  void addToCart(String productId) {
    _cartItems.add(productId);
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}
