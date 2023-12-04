import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/modules/add_product/controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PRODUCT'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.code,
            keyboardType: TextInputType.number,
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
            onPressed: () => controller.addProduct(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text("ADD PRODUCT"),
          ),
        ],
      ),
    );
  }
}
