import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Do tabs: Upcoming aur History
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Back button nahi chahiye kyunki ye Bottom Nav ka part hai
          title: const Text("My Bookings", style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            indicatorColor: Colors.blueAccent,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Upcoming"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingList(context, isHistory: false), // Upcoming bookings
            _buildBookingList(context, isHistory: true),  // Past bookings
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList(BuildContext context, {required bool isHistory}) {
    // Dummy data: Asli app mein ye data Firestore se aayega
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      index == 0 ? "Electrician" : "Plumber",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isHistory ? Colors.grey.shade200 : Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        isHistory ? "Completed" : "Scheduled",
                        style: TextStyle(
                          color: isHistory ? Colors.grey : Colors.blueAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.calendar_month, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text("12 Feb 2026", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 15),
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text("10:00 AM", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Divider(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Amount: ₹299", style: TextStyle(fontWeight: FontWeight.bold)),
                    if (!isHistory) // Agar upcoming hai toh 'Cancel' ka option
                      TextButton(
                        onPressed: () {},
                        child: const Text("Cancel", style: TextStyle(color: Colors.redAccent)),
                      )
                    else // Agar history hai toh 'Rebook' ka option
                      TextButton(
                        onPressed: () {},
                        child: const Text("Rebook", style: TextStyle(color: Colors.blueAccent)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}