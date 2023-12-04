import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code/app/controllers/product_controller.dart';

class UserStatusController extends SuperController {
  final ProductController _productController = Get.find<ProductController>();
  @override
  void onDetached() {}

  @override
  void onInactive() => GetStorage().write('allProducts', _productController.allProducts);

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void onHidden() {}
}
