class ProductRating {
  final double rate;
  final int count;

  ProductRating({
    required this.rate,
    required this.count,
  });

  factory ProductRating.fromJson(json) {
    return ProductRating(
      rate: (json['rate'] is num) ? (json['rate'] as num).toDouble() : 0.0,
      count: (json['count'] is int) ? json['count'] : 0,
    );
  }
}
