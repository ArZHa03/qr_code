import 'package:get/get.dart';

import '../modules/add_product/bindings/add_product_binding.dart';
import '../modules/add_product/views/add_product_view.dart';
import '../modules/detail_product/bindings/detail_product_binding.dart';
import '../modules/detail_product/views/detail_product_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/products/products_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.addProduct,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.products,
      page: () => const ProductsView(),
    ),
    GetPage(
      name: _Paths.detailProduct,
      page: () => DetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}
