import 'dart:developer';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_products_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> allProducts = [];
    try {
      List<dynamic> data = await Api().get(urlPath: "products");

      for (var item in data) {
        allProducts.add(ProductModel.fromJson(item));
      }
    } catch (e) {
      log('Error during GET request: $e');
      rethrow;
    }
    return allProducts;
  }
}
