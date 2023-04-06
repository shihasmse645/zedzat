import 'package:get/get.dart';

import '../services/webservice.dart';

class ServiceController extends GetxController {

  var isLoading = true.obs;
  var serviceList = [].obs;

  @override
  void onInit() {
    fetchServices();
    super.onInit();
  }

  void fetchServices() async {
    try {
      isLoading(true);
      var services = await HttpService.fetchServices();
      if (services != null) {
        serviceList.value = services;
      }
    } finally {
      isLoading(false);
    }
  }
}