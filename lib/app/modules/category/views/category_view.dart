import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../product_detail/views/product_detail_view.dart';
import '/../Users/muhre/PM-Fashion/lib/app/modules/home/views/home_view.dart';


import 'package:liedle/app/modules/product_detail/views/product_detail_view.dart';
import 'package:liedle/app/routes/app_pages.dart';

import '../controller/category_controller.dart';

class CategoryView extends StatelessWidget {
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

      body: Column(
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
                    PopupMenuItem(
                      value: 'Price: Low to High',
                      child: Text('Price: Low to High'),
                    ),
                    PopupMenuItem(
                      value: 'Price: High to Low',
                      child: Text('Price: High to Low'),
                    ),
                    PopupMenuItem(
                      value: 'Newest First',
                      child: Text('Newest First'),
                    ),
                  ],
                  child: Row(
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
                ),
                SizedBox(width: 40),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    print('Selected Sort: $value');
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Price: Low to High',
                      child: Text('Price: Low to High'),
                    ),
                    PopupMenuItem(
                      value: 'Price: High to Low',
                      child: Text('Price: High to Low'),
                    ),
                    PopupMenuItem(
                      value: 'Newest First',
                      child: Text('Newest First'),
                    ),
                  ],
                  child: Row(
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.65,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PRODUCT_DETAIL);
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
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

                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12.0)),
                                  child: Image.network(
                                    product.images.isNotEmpty
                                        ? product.images[0]
                                        : 'https://via.placeholder.com/150x200',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/placeholder.png');
                                    },

                                  ),
                                ),
                                Positioned(
                                  top: 135,
                                  right: 8,
                                  child: Obx(() => IconButton(
                                        icon: Icon(
                                          controller.isFavoriteList[index]
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              controller.isFavoriteList[index]
                                                  ? Colors.red
                                                  : Colors.black,
                                          size: 24,
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
                                          controller.toggleFavorite(index);
                                        },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 12.0),
                            child: Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, bottom: 8.0),
                            child: Text(
                              product.title.toUpperCase(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
