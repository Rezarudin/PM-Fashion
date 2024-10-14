import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_detail_controller.dart';
import 'package:flutter_image_carousel_slider/flutter_image_slider.dart';

class ProductDetailView extends StatefulWidget {
  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  // Access the controller via GetX dependency injection
  final ProductDetailController controller = Get.put(ProductDetailController());
  List<String> imageList = [
    "https://thumbs.dreamstime.com/z/luxury-yacht-mediteranean-sea-sardinia-26104031.jpg?ct=jpeg",
    "https://thumbs.dreamstime.com/z/luxury-yacht-sea-26613003.jpg?ct=jpeg",
    "https://thumbs.dreamstime.com/z/speed-boat-5750774.jpg?ct=jpeg",
  ];
  int _rating = 0;

  // Function to build each star
  Widget buildStar(int index) {
    return Container(
      width: 25,
      child: IconButton(
        icon: Icon(
          // Filled star if the index is less than the current rating
          index < _rating ? Icons.star : Icons.star_border,
          color: Colors.black,
        ),
        iconSize: 20, // Adjust icon size
        onPressed: () {
          setState(() {
            _rating = index + 1; // Update rating on click
          });
        },
      ),
    );
  }

  String selectedSize = '';

  // Function to handle button press
  void _selectSize(String size) {
    setState(() {
      selectedSize = size; // Update selected size
    });
  }

  String selectedColor = '';

  // Function to handle color selection
  void _selectColor(String color) {
    setState(() {
      selectedColor = color; // Update selected color
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Wrapping content with SingleChildScrollView for scrollability
            SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    child: ImageCarouselSlider(
                      items: imageList,
                      imageHeight: 350,
                      dotColor: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Name',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$0.00',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            return Row(
                              children: [
                                buildStar(index),
                                if (index < 4)
                                  SizedBox(width: 4), // Adjust spacing here
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Size'),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => _selectSize('S'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedSize == 'S'
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              child: Text('S'),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => _selectSize('M'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedSize == 'M'
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              child: Text('M'),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => _selectSize('L'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedSize == 'L'
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              child: Text('L'),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => _selectSize('XL'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedSize == 'XL'
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              child: Text('XL'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('Colors'),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => _selectColor('color1'),
                              child: Container(
                                margin: EdgeInsets.only(right: 8.0),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  border: Border.all(
                                    color: selectedColor == 'color1'
                                        ? Colors.red
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _selectColor('color2'),
                              child: Container(
                                margin: EdgeInsets.only(right: 8.0),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 0, 112, 224),
                                  border: Border.all(
                                    color: selectedColor == 'color2'
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _selectColor('color3'),
                              child: Container(
                                margin: EdgeInsets.only(right: 8.0),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 247, 158, 27),
                                  border: Border.all(
                                    color: selectedColor == 'color3'
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _selectColor('color4'),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 145, 31, 39),
                                  border: Border.all(
                                    color: selectedColor == 'color4'
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/card.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shop The Look'),
                          Text('Model Description')
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text('SM-SIZE')
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 300,
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 240,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/card.png',
                                              fit: BoxFit
                                                  .cover, // Adjust the fit as necessary
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              height: 300,
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 240,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/card.png',
                                              fit: BoxFit
                                                  .cover, // Adjust the fit as necessary
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right), // Chevron icon
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            'Detailed description of the product goes here.'),
                      ),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    title: Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right), // Chevron icon
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            'Detailed description of the product goes here.'),
                      ),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    title: Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right), // Chevron icon
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            'Detailed description of the product goes here.'),
                      ),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    title: Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right), // Chevron icon
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            'Detailed description of the product goes here.'),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
            // AppBar stacked on top of the body
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
