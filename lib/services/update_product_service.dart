import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_products_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
  }) async {
    Map<String, dynamic> data = await Api().put(urlPath: 'products/$id', data: {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
    });

    return ProductModel.fromJson(data);
  }
}
