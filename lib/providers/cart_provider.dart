import 'package:flutter/foundation.dart';
import 'package:order_aap/models/food.dart';

class CartProvider with ChangeNotifier {
  final List<Food> _cartItems = [];

  List<Food> get items => _cartItems;

  void addToCart(Food food) {
    _cartItems.add(food);
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cartItems.remove(food);
    notifyListeners();
  }

  double get totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.price);
}