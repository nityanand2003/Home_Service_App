// item_detail_page.dart

import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemImg;

  const ItemDetailPage({super.key, required this.itemName, required this.itemPrice, required this.itemImg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: Text(itemName, style: const TextStyle(color: Colors.blueAccent)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Image.asset('assets/image/$itemImg', fit: BoxFit.contain),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(itemPrice, style: const TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 15),
                  // Rating and Seller Info
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Text(" 4.5 (120 Reviews)", style: TextStyle(color: Colors.grey)),
                      const Spacer(),
                      const Text("Seller: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Sharma Hardware, Sasaram", style: TextStyle(color: Colors.blue.shade700)),
                    ],
                  ),

                  const Divider(height: 40),
                  const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "This is a high-quality product used for home maintenance. It comes with a 1-year warranty and is highly recommended by local experts.",
                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text("Add to Cart", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}