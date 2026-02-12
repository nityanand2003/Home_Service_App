import 'package:flutter/material.dart';
import 'worker_detail.dart';

class ServiceListPage extends StatelessWidget {
  final String categoryName;

  const ServiceListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Dummy Workers List (Asli app mein ye data Firestore se aayega)
    final List<Map<String, String>> workers = [
      {"name": "Shyam Kumar", "rating": "4.8", "exp": "5 Years", "price": "₹299"},
      {"name": "Rohan Singh", "rating": "4.5", "exp": "3 Years", "price": "₹249"},
      {"name": "Amit Sharma", "rating": "4.9", "exp": "8 Years", "price": "₹399"},
      {"name": "Vijay Verma", "rating": "4.7", "exp": "4 Years", "price": "₹279"},
    ];

    return Scaffold(
      appBar: AppBar(
        // Transparent light blue style jo humne navigation wrapper mein rakha tha
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: Text(categoryName, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context), // Back sequence maintain karne ke liye
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workers.length,
        itemBuilder: (context, index) {
          String fullName = workers[index]['name']!;
          // Image name logic: "Shyam Kumar" -> "shyam.jpeg"
          String imgName = "${fullName.split(' ')[0].toLowerCase()}.jpeg";

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/image/$imgName'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                fullName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" ${workers[index]['rating']} • ${workers[index]['exp']} Exp."),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Starting from ${workers[index]['price']}",
                    style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              onTap: () {
                // Next page par jane ke liye Navigator.push use karein
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerDetailPage(
                      workerName: fullName,
                      workerImage: imgName,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}