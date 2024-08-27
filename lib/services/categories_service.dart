import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_products_model.dart';

class CategoriesService {
  Future<List<dynamic>> getCategories({required String categoryName}) async {
    List<dynamic> categories = [];
    List<dynamic> data = await Api().get(urlPath: "products/categories/$categoryName");
    categories = data.map((e) => ProductModel.fromJson(e)).toList();
    return categories;
  }
}
