// lib/features/login/login_page.dart
import 'package:cobalagi/features/sign_up/sign_up_page.dart';
import 'package:cobalagi/features/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text("Malang, Indonesia"),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Let's Sign You In",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 32),
            // Username or Email field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username or Email',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Password field
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Sign in button
            ElevatedButton(
              onPressed: () {
                // Navigate to store page after login
                Get.to(StorePage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD3A335), // Gold Color
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SIGN IN"),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Sign up text
            TextButton(
              onPressed: () {
                // Navigate to Sign Up Page
                Get.to(SignUpPage());
              },
              child: const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Facebook connect button
            ElevatedButton.icon(
              onPressed: () {
                // Add Facebook login action here
              },
              icon: const Icon(Icons.facebook),
              label: const Text("Connect with Facebook"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Facebook blue color
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}