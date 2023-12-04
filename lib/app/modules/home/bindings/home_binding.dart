import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code/app/controllers/user_status_controller.dart';

import '../../../controllers/product_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    await GetStorage.init();
    Get.put(
      ProductController(),
      permanent: true,
    );
    Get.put(
      UserStatusController(),
      permanent: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
