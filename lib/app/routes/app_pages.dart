import 'package:get/get.dart';
import 'package:liedle/app/modules/category/views/category_view.dart';
import 'package:liedle/app/modules/login/bindings/login_binding.dart';
import 'package:liedle/app/modules/login/views/login_view.dart';
import 'package:liedle/app/modules/product_detail/bindings/product_detail_bindings.dart';
import 'package:liedle/app/modules/product_detail/views/product_detail_view.dart';
import 'package:liedle/app/modules/product_detail/views/product_detail_web_view.dart';
import 'package:liedle/app/modules/register/bindings/register_binding.dart';
import 'package:liedle/app/modules/register/views/register_view.dart';

import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => ProductDetailWebView(),
      //binding: RegisterBinding(),
    ),
  ];
}
