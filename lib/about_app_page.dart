import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("About App", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo & Name
            Center(
              child: Column(
                children: [
                  Image.asset('assets/image/logo.png', height: 100),
                  const SizedBox(height: 10),
                  const Text("Bihari Rang", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                  const Text("V 1.0.0", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            const Text("App Ki Khasiyat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // Khasiyat List
            _buildFeatureItem(Icons.verified_user, "Verified Workers", "Saare workers fully verified aur expert hain."),
            _buildFeatureItem(Icons.timer, "Quick Service", "Aapke ek click par service aapke darwaje par."),
            _buildFeatureItem(Icons.shopping_bag, "One-Stop Shop", "Service ke saath zaroori hardware saaman bhi kharidein."),
            _buildFeatureItem(Icons.currency_rupee, "Transparent Pricing", "Koi hidden charge nahi, fix aur affordable rates."),
            _buildFeatureItem(Icons.support_agent, "Local Support", "Bihar ke apne logo ke liye, Bihar ki apni service."),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "Bihari Rang Home Services ek aisi pehal hai jo Sasaram aur aas-paas ke ilakon mein rehne waale logon ko unki zarurat ki saari home services aur hardware items ek hi platform par muhaiya karati hai.",
              style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Icon(icon, color: Colors.blueAccent, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(desc, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}