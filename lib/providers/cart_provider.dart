import 'package:flutter/material.dart';
import '../models/food.dart';

class CartProvider with ChangeNotifier {
  final List<Food> _items = [];

  List<Food> get items => _items;

  void addToCart(Food food) {
    _items.add(food);
    notifyListeners(); // This triggers the UI to refresh
  }

  void removeItem(Food food) {
    _items.remove(food);
    notifyListeners();
  }

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}