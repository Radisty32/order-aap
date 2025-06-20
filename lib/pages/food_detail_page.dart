import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/cart_provider.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;

  const FoodDetailPage({super.key,required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(food.imageUrl),
            SizedBox(height: 20),
            Text(food.description),
            SizedBox(height: 20),
            Text('Harga: Rp${food.price.toStringAsFixed(0)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addToCart(food);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${food.name} ditambahkan ke keranjang'),
                  ),
                );
              },
              child: Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
