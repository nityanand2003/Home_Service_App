import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final String serviceName;
  final String selectedDate;
  final String selectedTime;

  const SummaryScreen({
    super.key,
    required this.serviceName,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Same transparent AppBar style as requested
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("Booking Summary", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context), // Maintain back sequence
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Service Detail Card
            _buildSectionTitle("Service Details"),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade50,
                  child: const Icon(Icons.build_circle, color: Colors.blueAccent),
                ),
                title: Text(serviceName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Date: $selectedDate\nTime: $selectedTime"),
                isThreeLine: true,
              ),
            ),
            const SizedBox(height: 25),

            // 2. Service Location (Address)
            _buildSectionTitle("Service Location"),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.redAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "H.No 123, Ward No. 5, Kharari, Bihar - 84xxxx",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                  Icon(Icons.edit, size: 18, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // 3. Payment Summary
            _buildSectionTitle("Payment Summary"),
            _buildPriceRow("Service Fee", "₹249"),
            _buildPriceRow("Visiting Charges", "₹50"),
            _buildPriceRow("Tax (GST)", "₹0"),
            const Divider(height: 30),
            _buildPriceRow("Total Amount", "₹299", isTotal: true),

            const SizedBox(height: 40),

            // 4. Payment Method Illustration
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/image/banner.jpeg'), // Using your banner image as background
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black45,
                ),
                child: const Center(
                  child: Text(
                    "Payment Method: Cash on Delivery",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // 5. Final Place Order Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            _showSuccessDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text("Confirm Booking", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
    );
  }

  Widget _buildPriceRow(String label, String price, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(price, style: TextStyle(fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Colors.blueAccent : Colors.black)),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
        content: const Text("Booking Confirmed Successfully!", textAlign: TextAlign.center),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Return to Home Page and clear stack
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text("Go to Home"),
            ),
          )
        ],
      ),
    );
  }
}