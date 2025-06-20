import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 131, 188, 235),
      appBar: AppBar(title: const Text('Keranjang',  style: TextStyle(fontWeight: FontWeight.bold))),
      body: cart.items.isEmpty
          ? const Center(child: Text('Keranjang kosong',  style: TextStyle(fontWeight: FontWeight.bold)))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cart.items.length + 1,
              itemBuilder: (context, index) {
                // Jika index terakhir, tampilkan total harga
                if (index == cart.items.length) {
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: const EdgeInsets.only(top: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Harga:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cart.totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final item = cart.items[index];
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => cart.removeFromCart(item),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
