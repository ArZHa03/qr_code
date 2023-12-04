import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';
import '../../../data/models/product_model.dart';

class AddProductController extends GetxController {
  final ProductController _productController = Get.find<ProductController>();

  final TextEditingController code = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController qty = TextEditingController();

  void addProduct() {
    if (code.text.isEmpty || name.text.isEmpty || qty.text.isEmpty) {
      _callSnackBar();
    } else {
      _saveProduct();
      Get.back();
    }
  }

  void _callSnackBar() {
    if (!Get.isSnackbarOpen) Get.snackbar("Error", "Semua data wajib diisi.");
  }

  void _saveProduct() {
    _productController.createProduct(
      ProductModel(
        code: code.text,
        name: name.text,
        qty: int.parse(qty.text),
      ),
    );
  }
}
