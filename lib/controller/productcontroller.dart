import 'package:get/get.dart';

import '../services/webservice.dart';

class ProductController extends GetxController {

  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}