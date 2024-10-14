import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liedle/app/modules/login/views/login_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fashionista'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      // Drawer added to the Scaffold
      drawer: Drawer(
        child: ListView(
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close)),
              SizedBox(
                width: 200,
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.line_weight_rounded))
            ]),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Shop'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Sign Up / Login'),
              onTap: () {
                Get.to(LoginView()); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Notification'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text('Need Help?'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
