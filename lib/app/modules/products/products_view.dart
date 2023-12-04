import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../controllers/product_controller.dart';
import '../../data/models/product_model.dart';
import '../../routes/app_pages.dart';

class ProductsView extends GetView<ProductController> {
  const ProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCTS'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.allProducts.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          ProductModel product = controller.allProducts[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.detailProduct, arguments: product);
              },
              borderRadius: BorderRadius.circular(9),
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.code,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(product.name),
                          Text("Quantity : ${product.qty}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: QrImageView(
                        data: product.code,
                        size: 200.0,
                        version: QrVersions.auto,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
