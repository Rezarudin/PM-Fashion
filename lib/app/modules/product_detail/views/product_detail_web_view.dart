
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:liedle/app/data/model/brands.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:liedle/app/modules/product_detail/controller/product_detail_controller.dart';

class ProductDetailWebView extends GetView<ProductDetailController> {
  final BrandElement brand; // Change this to BrandElement
  const ProductDetailWebView({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body: WebViewWidget(
        controller:
            controller.webViewController(brand.website), // Use brand.website
      ),
    );
  }
}
