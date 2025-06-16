import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/food_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  final List<Food> foods = [
    Food(
      id: '1',
      name: 'Burger',
      price: 25000,
      imageUrl: 'https://i.imgur.com/5Aqgz7o.png',
      description: 'Burger lezat dengan keju dan daging sapi.',
    ),
    Food(
      id: '2',
      name: 'Pizza',
      price: 45000,
      imageUrl: 'https://i.imgur.com/eP4JGJN.png',
      description: 'Pizza dengan topping keju dan pepperoni.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartPage()),
            ),
          )
        ],
      ),
      body: ListView(
        children: foods.map((food) => FoodTile(food: food)).toList(),
      ),
    );
  }
}