import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  final RxList<ProductModel> _allProducts = Get.find<ProductController>().allProducts;

  ProductModel getProductById(String codeProduct) => _allProducts.firstWhere((element) => element.code == codeProduct);
}
