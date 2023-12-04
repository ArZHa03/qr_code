import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../data/models/product_model.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  DetailProductView({super.key});

  final ProductModel _product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.code.text = _product.code;
    controller.name.text = _product.name;
    controller.qty.text = "${_product.qty}";

    return Scaffold(
      appBar: AppBar(
        title: const Text('DETAIL PRODUCT'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: QrImageView(
                  data: _product.code,
                  size: 200.0,
                  version: QrVersions.auto,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            controller: controller.code,
            keyboardType: TextInputType.number,
            readOnly: true,
            maxLength: 10,
            decoration: InputDecoration(
              labelText: "Product Code",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            controller: controller.name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Product Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            controller: controller.qty,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Quantity",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () => controller.editProduct(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text("UPDATE PRODUCT"),
          ),
          TextButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Delete Product",
                middleText: "Are you sure to delete this product ?",
                actions: [
                  OutlinedButton(
                    onPressed: () => Get.back(),
                    child: const Text("CANCEL"),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.removeProduct(),
                    child: const Text("DELETE"),
                  ),
                ],
              );
            },
            child: Text(
              "Delete product",
              style: TextStyle(
                color: Colors.red.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
