import 'package:flutter/material.dart';
import 'package:order_aap/models/food.dart';
import 'package:order_aap/providers/cart_provider.dart';
import 'package:order_aap/providers/food_api_services.dart';
import 'package:provider/provider.dart';
import 'package:order_aap/pages/profile_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiFoosService apiService = ApiFoosService();
  late Future<List<Food>> _foodsFuture;
  final TextEditingController _searchController = TextEditingController();

  List<Food> _allFoods = [];
  List<Food> _filteredFoods = [];

  @override
  void initState() {
    super.initState();
    _foodsFuture = apiService.fetchFoods().then((foods) {
      _allFoods = foods;
      _filteredFoods = foods;
      return foods;
    });
  }

  void _filterFoods(String query) {
    final filtered =
        _allFoods.where((food) {
          final nameLower = food.name.toLowerCase();
          return nameLower.contains(query.toLowerCase());
        }).toList();

    setState(() {
      _filteredFoods = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 229, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Phiiyoo Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ), // beri jarak dari kanan
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileDetailPage()),
                );
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/image/WhatsApp Image 2025-06-20 at 16.16.20_cf50605b.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Icon(Icons.verified_user, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),

      body: FutureBuilder<List<Food>>(
        future: _foodsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data makanan.'));
          }

          return Column(
            children: [
              // 🔍 TextField Pencarian
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterFoods,
                  decoration: InputDecoration(
                    hintText: 'Cari produk...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // 📦 GridView Produk
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _filteredFoods.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final food = _filteredFoods[index];
                    return Card(
                      color: const Color.fromARGB(255, 131, 188, 235),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                food.imageUrl,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              food.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              food.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${food.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(
                                      context,
                                      listen: false,
                                    ).addToCart(food);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    textStyle: const TextStyle(fontSize: 12),
                                  ),
                                  child: const Icon(Icons.shopping_cart),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
