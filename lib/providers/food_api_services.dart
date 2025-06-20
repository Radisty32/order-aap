import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:order_aap/models/food.dart';

class ApiFoosService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Food>> fetchFoods() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data produk');
    }
  }
}
