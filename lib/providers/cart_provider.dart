import 'C:flutter/foundation.dart';
import '../models/food.dart';

class CartProvider with ChangeNotifier {
  final List<Food> _cartItems = [];

  List<Food> get items => _cartItems;

  void addToCart(Food food) {
    _cartItems.add(food);
    notifyListeners();
  }
