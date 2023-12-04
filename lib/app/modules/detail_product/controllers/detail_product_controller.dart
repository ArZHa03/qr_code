import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/routes/app_pages.dart';

import '../../../controllers/product_controller.dart';
import '../../../data/models/product_model.dart';

class DetailProductController extends GetxController {
  final ProductController _productController = Get.find<ProductController>();

  final TextEditingController code = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController qty = TextEditingController();

  void removeProduct() {
    _productController.deleteProduct(code.text);
    Get.offAllNamed(Routes.home);
  }

  void editProduct() {
    if (name.text.isEmpty || qty.text.isEmpty) {
      _callSnackBar();
    } else {
      _saveProduct();
      Get.offAllNamed(Routes.home);
    }
  }

  void _callSnackBar() {
    if (!Get.isSnackbarOpen) Get.snackbar("Error", "Semua data wajib diisi.");
  }

  void _saveProduct() {
    _productController.updateProduct(
      code.text,
      ProductModel(
        code: code.text,
        name: name.text,
        qty: int.parse(qty.text),
      ),
    );
  }
}
