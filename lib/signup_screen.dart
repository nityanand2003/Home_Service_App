import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Iske liye 'intl' package pubspec.yaml mein add karein

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // 1. Controllers for Form Fields
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();

  // 2. Date Picker Logic
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Header Image
            Image.asset('assets/image/signup.png', height: 120),
            const SizedBox(height: 30),

            // Name Field
            _buildTextField(_nameController, "Full Name", Icons.person, TextInputType.name),
            const SizedBox(height: 15),

            // Mobile Field
            _buildTextField(_mobileController, "Mobile Number", Icons.phone, TextInputType.phone),
            const SizedBox(height: 15),

            // Email Field
            _buildTextField(_emailController, "Email Address", Icons.email, TextInputType.emailAddress),
            const SizedBox(height: 15),

            // DOB Field (Read Only with Tap)
            TextField(
              controller: _dobController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: "Date of Birth",
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 15),

            // Address Field (Multi-line)
            TextField(
              controller: _addressController,
              maxLines: 3,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: "Full Address",
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),

            // Signup Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Abhi ke liye seedhe Home par bhej rahe hain
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Sign Up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build standard text fields
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, TextInputType type) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}