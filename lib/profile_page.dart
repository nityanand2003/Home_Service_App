import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("My Profile", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(radius: 55, backgroundImage: AssetImage('assets/image/nitya.jpeg')),
                  const SizedBox(height: 12),
                  const Text("Nityanand Kumar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text("+91 7856876825", style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 1, indent: 20, endIndent: 20),

            _buildProfileItem(Icons.edit_outlined, "Edit Profile", Colors.blueAccent),
            _buildProfileItem(Icons.language_outlined, "Change Language", Colors.orange),
            _buildProfileItem(Icons.monetization_on_outlined, "Earned Coins", Colors.amber),
            _buildProfileItem(Icons.history, "Booking History", Colors.green),
            _buildProfileItem(Icons.notifications_active_outlined, "Manage Notifications", Colors.purple),

            const Divider(thickness: 1, indent: 20, endIndent: 20),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Logout", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/auth_option', (route) => false),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, Color iconColor) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: iconColor, size: 24),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}