import 'package:flutter/material.dart';
import 'service_list.dart'; // Is file ko hum agle step mein update karenge

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Top 9 Categories with their specific image names
  final List<Map<String, String>> topCategories = [
    {"name": "Electrician", "img": "electrician.jpeg", "color": "0xFFE3F2FD"},
    {"name": "Plumber", "img": "plumber.jpeg", "color": "0xFFF1F8E9"},
    {"name": "Carpenter", "img": "carpenter.jpeg", "color": "0xFFFFF3E0"},
    {"name": "Cleaner", "img": "cleaner.jpeg", "color": "0xFFF3E5F5"},
    {"name": "Barber", "img": "barber.jpeg", "color": "0xFFE1F5FE"},
    {"name": "Painter", "img": "painter.jpeg", "color": "0xFFFCE4EC"},
    {"name": "AC Repair", "img": "ac_repair.jpeg", "color": "0xFFE0F2F1"},
    {"name": "Mechanic", "img": "mechanic.jpeg", "color": "0xFFFFF8E1"},
    {"name": "Gardener", "img": "gardener.jpeg", "color": "0xFFE8F5E9"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 110, left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          const SizedBox(height: 25),

          // 1. Elevated Monthly/Temporary Buttons
          Row(
            children: [
              _buildSpecialElevatedCategory(
                  "Monthly /\nPermanent",
                  Colors.blue.shade400,
                  Icons.assignment_ind
              ),
              const SizedBox(width: 15),
              _buildSpecialElevatedCategory(
                  "Alternative /\nTemporary",
                  Colors.orange.shade400,
                  Icons.handyman
              ),
            ],
          ),
          const SizedBox(height: 30),

          // 2. Grid Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Top Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              TextButton(
                  onPressed: () {
                    // View all categories logic
                  },
                  child: const Text("View All", style: TextStyle(fontWeight: FontWeight.bold))
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 3. 3x3 Elevated Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.75,
            ),
            itemCount: topCategories.length,
            itemBuilder: (context, index) {
              return _buildCategoryCard(
                context,
                topCategories[index]['name']!,
                topCategories[index]['img']!,
                Color(int.parse(topCategories[index]['color']!)),
              );
            },
          ),
        ],
      ),
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search categories...",
          prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  // Elevated Special Buttons
  Widget _buildSpecialElevatedCategory(String title, Color color, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 6,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 110,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 35, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Elevated Category Cards
  Widget _buildCategoryCard(BuildContext context, String name, String img, Color bgColor) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: bgColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServiceListPage(categoryName: name)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/image/$img'), // Category specific image
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}