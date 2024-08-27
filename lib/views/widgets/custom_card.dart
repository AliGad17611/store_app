import 'package:flutter/material.dart';
import 'package:store_app/models/all_products_model.dart';
import 'package:store_app/views/update_product_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductView.id,arguments: product);
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 180, maxWidth: 230),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.length > 6
                          ? '${product.title.substring(0, 6)}...'
                          : product.title,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                              fontSize: 22, color: Colors.black),
                        ),
                        const Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: -20,
                  bottom: 60,
                  child: Image.network(
                    product.image,
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
