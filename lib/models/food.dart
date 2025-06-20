class Food {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['title'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'],
      description: json['description'],
    );
  }
}
