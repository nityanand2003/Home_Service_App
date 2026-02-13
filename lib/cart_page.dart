import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Dummy Cart Items
  List<Map<String, dynamic>> cartItems = [
    {"name": "LED Bulb 12W", "price": 149, "img": "led_bulb.jpeg", "qty": 1},
    {"name": "Tap Mixer", "price": 1299, "img": "tap.jpeg", "qty": 1},
  ];

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['qty']));
  double deliveryFee = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("My Cart", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(index);
              },
            ),
          ),
          _buildPriceSummary(),
        ],
      ),
      bottomNavigationBar: _buildCheckoutButton(),
    );
  }

  // --- Empty Cart UI ---
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 15),
          const Text("Your cart is empty!", style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  // --- Individual Cart Item Card ---
  Widget _buildCartItem(int index) {
    final item = cartItems[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 70, width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/image/${item['img']}', fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5),
                  Text("₹${item['price']}", style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Quantity Controller
            Row(
              children: [
                _qtyBtn(Icons.remove, () {
                  setState(() {
                    if (item['qty'] > 1) item['qty']--;
                    else cartItems.removeAt(index);
                  });
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("${item['qty']}", style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                _qtyBtn(Icons.add, () {
                  setState(() => item['qty']++);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(5)),
        child: Icon(icon, size: 16, color: Colors.blueAccent),
      ),
    );
  }

  // --- Price Breakdown Section ---
  Widget _buildPriceSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          _priceRow("Subtotal", "₹${subtotal.toStringAsFixed(0)}"),
          _priceRow("Delivery Fee", "₹${deliveryFee.toStringAsFixed(0)}"),
          const Divider(height: 25),
          _priceRow("Total Amount", "₹${(subtotal + deliveryFee).toStringAsFixed(0)}", isTotal: true),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isTotal = false}) { // Fixed 'String' spelling here
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              label,
              style: TextStyle( // Fixed: Added 'TextStyle'
                  fontSize: isTotal ? 18 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal
              )
          ),
          Text(
              value,
              style: TextStyle( // Fixed: Added 'TextStyle'
                  fontSize: isTotal ? 18 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: isTotal ? Colors.black : Colors.blueAccent // Optional: for better look
              )
          ),
        ],
      ),
    );
  }

  // --- Bottom Checkout Button ---
  Widget _buildCheckoutButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: ElevatedButton(
        onPressed: cartItems.isEmpty ? null : () {
          // Final Payment/Address Logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: const Text("Proceed to Checkout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}