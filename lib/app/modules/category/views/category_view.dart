import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('CATEGORY'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
        ],
      ),
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
                                        onPressed: () {
                                          controller.toggleFavorite(index);
                                        },
                                      )),
                                ),
                              ],
                            ),
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
