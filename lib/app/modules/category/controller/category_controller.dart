import 'package:get/get.dart';

class CategoryController extends GetxController {
  // Define the isFavorite status as an RxBool so it can be reactive
  var isFavoriteList = List<bool>.filled(2, false).obs;

  // Function to toggle the favorite status
  void toggleFavorite(int index) {
    isFavoriteList[index] = !isFavoriteList[index];
  }
}
