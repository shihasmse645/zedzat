import 'package:http/http.dart' as http;

import '../model/productclass.dart';
import '../model/serviceclass.dart';



class HttpService {
  // static var client = http.Client();

  static Future<List<Products>> fetchProducts() async {
    var response = await http.get(Uri.parse("https://service-zedzat.tequevia.com/api/v1/zedzat/product-category/?category_type=product"));

    if (response.statusCode == 200) {
      var data = response.body;
      return productsFromJson(data);
    } else {
      // throw Exception();
      var data = response.body;
      return productsFromJson(data);
    }
  }

  static Future<List<Services>> fetchServices() async {
    var response = await http.get(Uri.parse("https://service-zedzat.tequevia.com/api/v1/zedzat/product-category/?category_type=service"));

    if (response.statusCode == 200) {
      var data = response.body;
      return servicesFromJson(data);
    } else {
      // throw Exception();
      var data = response.body;
      return servicesFromJson(data);
    }
  }
}