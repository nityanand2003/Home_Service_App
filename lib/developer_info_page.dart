import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // LinkedIn aur Email ke liye

class DeveloperInfoPage extends StatelessWidget {
  const DeveloperInfoPage({super.key});

  final List<Map<String, String>> teamMembers = const [
    {
      "name": "Himanshu",
      "role": "Team Leader - Project Handling",
      "img": "himanshu.jpeg",
      "phone": "+91 6206962918",
      "email": "himanshuans512@gmail.com",
      "linkedin": "https://www.linkedin.com/in/himanshu-kumar-6b7a13265"
    },
    {
      "name": "Sandeep Kumar",
      "role": "Documentation - Report & PPT",
      "img": "sandeep.jpeg",
      "phone": "+91 9576373510",
      "email": "sk7301147@gmail.com",
      "linkedin": "https://www.linkedin.com/in/sandeep-kumar-7ab618155"
    },
    {
      "name": "Raj Kumar",
      "role": "Data Handling - User & Worker",
      "img": "raj.jpeg",
      "phone": "+91 9031417171",
      "email": "rajkumardos81@gmail.com",
      "linkedin": "https://www.linkedin.com/in/raj-kumar-a10b38259"
    },
    {
      "name": "Nityanand Kumar",
      "role": "App Developer - UI Design",
      "img": "nityanand.jpeg",
      "phone": "+91 7856876825",
      "email": "03nkumar01@gmail.com",
      "linkedin": "https://www.linkedin.com/in/nkumar03"
    },
    {
      "name": "Manish Kumar",
      "role": "App Testing",
      "img": "manish.jpeg",
      "phone": "+91 7320970841",
      "email": "manishgupta45264@gmail.com",
      "linkedin": "https://www.linkedin.com/in/manish-kumar-6237b4265/"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        elevation: 0,
        title: const Text("Our Team", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          final member = teamMembers[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/image/${member['img']}'),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(member['name']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text(member['role']!, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _socialIcon(Icons.phone, Colors.green, () => _launchURL("tel:${member['phone']}")),
                      _socialIcon(Icons.email, Colors.redAccent, () => _launchURL("mailto:${member['email']}")),
                      _socialIcon(Icons.link, Colors.blue, () => _launchURL(member['linkedin']!)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }
}