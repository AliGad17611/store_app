import 'package:store_app/helper/api.dart';

class AllCategoryService {

  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> allCategory = [];
    allCategory = await Api().get(urlPath: "products/categories") ;
    return allCategory;
  }
  
}