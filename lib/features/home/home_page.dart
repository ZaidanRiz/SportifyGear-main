// lib/features/home/home_page.dart
import 'package:cobalagi/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular Image
              Container(
                width: 275,
                height: 275,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/sportify.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Welcome Text
              const Text(
                "Welcome to Sportify Gear!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              Text(
                "With long experience in the sports industry, we sell the best quality products with affordable prices",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 32),
              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to login page
                  Get.to(LoginPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD3A335), // Gold Color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: const Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}