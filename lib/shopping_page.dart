import 'package:flutter/material.dart';
import 'category_product_page.dart';
import 'item_detail_page.dart';
import 'cart_page.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Categories List
    final List<Map<String, dynamic>> categories = [
      {"name": "Electrical", "icon": Icons.electrical_services},
      {"name": "Plumbing", "icon": Icons.plumbing},
      {"name": "Hardware", "icon": Icons.handyman},
      {"name": "Painting", "icon": Icons.format_paint},
      {"name": "Tools", "icon": Icons.build},
      {"name": "Cleaning", "icon": Icons.cleaning_services},
    ];

    // Dummy Products
    final List<Map<String, String>> products = [
      {"name": "LED Bulb 12W", "price": "149", "img": "led_bulb.jpeg"},
      {"name": "Tap Mixer", "price": "1299", "img": "tap.jpeg"},
      {"name": "Drill Machine", "price": "2499", "img": "drill.jpeg"},
      {"name": "Door Lock", "price": "750", "img": "lock.jpeg"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("Bihari Rang Shop",
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),

        // Yahan se naya code shuru hota hai:
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.blueAccent),
            onPressed: () {
              // Is par click karne se Cart Page khulega
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSearchBar(),
            ),

            // 2. Categories Section (In a Box)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Shop by Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            // Horizontal Scroll Box
            Container(
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                scrollDirection: Axis.horizontal, // Scroll enable
                physics: const BouncingScrollPhysics(), // Smooth scrolling
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryItem(context, categories[index]);
                },
              ),
            ),

            const SizedBox(height: 30),

            // 3. Featured Products Grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Trending Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildProductGrid(products),
            ),
          ],
        ),
      ),
    );
  }

  // Search Bar Widget
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search hardware, electricals...",
          prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  // Category Item Widget
  Widget _buildCategoryItem(BuildContext context, Map<String, dynamic> category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductPage(categoryName: category['name']),
          ),
        );
      },
      child: Container(
        width: 90,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade50,
              child: Icon(category['icon'], color: Colors.blueAccent, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              category['name'],
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // Product Grid Widget
  Widget _buildProductGrid(List<Map<String, String>> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(context, products[index]);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailPage(
                itemName: product['name']!,
                itemPrice: "₹${product['price']}",
                itemImg: product['img']!,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: Center(
                  child: Image.asset('assets/image/${product['img']}', fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 5),
                  Text("₹${product['price']}",
                      style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}