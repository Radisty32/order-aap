import 'package:flutter/material.dart';
import '../models/food.dart';
import '../pages/food_detail_page.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({required this.food});

    @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(food.imageUrl, width: 60),
      title: Text(food.name),
      subtitle: Text('Rp${food.price.toStringAsFixed(0)}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FoodDetailPage(food: food)),
        );
      },
    );
  }
}