import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'booking_page.dart'; // Booking list page
import 'shopping_page.dart';
import 'profile_page.dart';
import 'about_app_page.dart'; // Naya page import karein
import 'developer_info_page.dart'; // Naya page import karein

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _selectedIndex = 0;

  // Pages ki list
  final List<Widget> _pages = [
    const HomeScreen(),
    const BookingPage(),
    const ShoppingPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Transparent AppBar Style
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("Bihari Rang",
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),

      // 2. Updated Drawer with Team & About Links
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/image/logo.png'),
              ),
              accountName: const Text("User Name", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: const Text("+91 9876543210"),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined, color: Colors.blueAccent),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _selectedIndex = 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.blueAccent),
              title: const Text("About App"),
              onTap: () {
                Navigator.pop(context); // Drawer close karein
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutAppPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.groups_outlined, color: Colors.blueAccent),
              title: const Text("Our Team"), // Developer Info Page
              onTap: () {
                Navigator.pop(context); // Drawer close karein
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeveloperInfoPage()));
              },
            ),
            const Spacer(), // Baaki items ko niche push karne ke liye
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Logout", style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/auth_option', (route) => false);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      body: _pages[_selectedIndex],

      // 3. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Shopping"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
