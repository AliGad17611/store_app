import 'package:store_app/models/product_rating.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ProductRating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: (json['id'] is int) ? (json['id'] as int) : int.parse(json['id']),
        title: json['title'] ?? 'Unknown Title',
        price: (json['price'] is String
            ? double.tryParse(json['price']) ?? 0.0
            : (json['price'] is int)
                ? (json['price'] as int).toDouble()
                : (json['price'] is double)
                    ? json['price']
                    : 0.0),
        description: json['description'] ?? 'No description available',
        category: json['category'] ?? 'Uncategorized',
        image: json['image'] ?? '',
        rating: json['rating'] != null
            ? ProductRating.fromJson(json['rating'])
            : ProductRating(rate: 0.0, count: 0),
      );
    } catch (e) {
      throw FormatException('Error parsing ProductModel: $e');
    }
  }
}
