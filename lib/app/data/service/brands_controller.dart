import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:liedle/app/data/model/brands.dart';

class BrandsController extends GetxController {
  static const String _baseUrl =
      'https://my-json-server.typicode.com/Renocalvo/Liedle-Api/';

  RxList<Brand> brands = RxList<Brand>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchProduct();
    super.onInit();
  }

  Future<void> fetchProduct() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${_baseUrl}db'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Brand> brandResult =
            jsonData.map((item) => Brand.fromJson(item)).toList();

        brands.value = brandResult; // Set the entire list of Product objects
      } else {
        print("Request failed with status ${response.statusCode}");
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false; // Set loading to false when done
    }
  }
}
