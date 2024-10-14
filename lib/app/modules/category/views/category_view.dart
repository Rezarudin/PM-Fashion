import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../product_detail/views/product_detail_view.dart';
import '/../Users/muhre/PM-Fashion/lib/app/modules/home/views/home_view.dart';

import '../controller/category_controller.dart';

class CategoryView extends StatelessWidget {
  // Access the controller via GetX dependency injection
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(HomeView());
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('CATEGORY'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      print('Selected Sort: $value');
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'Price: Low to High',
                        child: Text('Price: Low to High'),
                      ),
                      const PopupMenuItem(
                        value: 'Price: High to Low',
                        child: Text('Price: High to Low'),
                      ),
                      const PopupMenuItem(
                        value: 'Newest First',
                        child: Text('Newest First'),
                      ),
                    ],
                    child: const Row(
                      children: [
                        Text(
                          'SORT',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.black)
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      print('Selected Sort: $value');
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'Price: Low to High',
                        child: Text('Price: Low to High'),
                      ),
                      const PopupMenuItem(
                        value: 'Price: High to Low',
                        child: Text('Price: High to Low'),
                      ),
                      const PopupMenuItem(
                        value: 'Newest First',
                        child: Text('Newest First'),
                      ),
                    ],
                    child: const Row(
                      children: [
                        Text(
                          'FILTER',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                // First card with favorite icon toggle
                SizedBox(
                    width: 170,
                    height: 300,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ProductDetailView());
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 240,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/card.png',
                                      fit: BoxFit
                                          .cover, // Adjust the fit as necessary
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 2,
                                  child: Obx(() => IconButton(
                                        onPressed: () {
                                          controller.toggleFavorite(0);
                                        },
                                        icon: Icon(
                                          controller.isFavoriteList[0]
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: controller.isFavoriteList[0]
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$0.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Item Name 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(width: 15),
                // Second card (can add similar behavior if needed)
                SizedBox(
                    width: 170,
                    height: 300,
                    child: GestureDetector(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 240,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/card.png',
                                      fit: BoxFit
                                          .cover, // Adjust the fit as necessary
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 2,
                                  child: Obx(() => IconButton(
                                        onPressed: () {
                                          controller.toggleFavorite(1);
                                        },
                                        icon: Icon(
                                          controller.isFavoriteList[1]
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: controller.isFavoriteList[1]
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$0.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Item Name 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
