import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> allProducts = List<ProductModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    allProducts.value = GetStorage().read('allProducts').map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
  }

  void createProduct(ProductModel product) => allProducts.add(product);
  void updateProduct(String code, ProductModel product) =>
      allProducts[allProducts.indexWhere((element) => element.code == code)] = product;
  void deleteProduct(String code) => allProducts.removeWhere((element) => element.code == code);
}
