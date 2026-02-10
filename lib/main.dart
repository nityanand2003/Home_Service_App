import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart'; // Firebase use karne par uncomment karein
import 'splash_screen.dart';
import 'auth_option_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'navigation_wrapper.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Firebase setup ke baad ise on karein
  runApp(const HomeServiceApp());
}

class HomeServiceApp extends StatelessWidget {
  const HomeServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bihari Rang Home Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
        fontFamily: 'Poppins', // Agar Google Fonts use karein to
      ),
      // Sabse pahle Splash Screen khulegi
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/auth_option': (context) => const AuthOptionScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const NavigationWrapper(),
      },
    );
  }
}