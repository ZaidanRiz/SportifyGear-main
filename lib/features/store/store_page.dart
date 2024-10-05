import 'package:flutter/material.dart';
import 'package:cobalagi/features/wishlist/wishlist_page.dart';
import 'package:cobalagi/features/profile/profile_page.dart';
import 'package:cobalagi/features/chat/chat_page.dart'; // Import your chat page
import 'package:cobalagi/features/cart/cart_page.dart';
import 'package:get/get.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<String> wishlist = [];
  int _currentIndex = 0; // Track the current index

  void _addToWishlist(String item) {
    setState(() {
      wishlist.add(item);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index
    });

    switch (index) {
      case 0:
        // Home Page - This is the current page, do nothing
        break;
      case 1:
        // Navigate to Wishlist
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WishlistPage(wishlist: wishlist),
          ),
        );
        break;
      case 2:
        // Navigate to CartPage
        Get.to(CartPage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFD3A335),
          elevation: 0,
          title: const Text("Store Page"),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(ProfilePage(), arguments: {
                  'username': 'Berrylab',
                  'email': 'berrylabyantara@gmail.com',
                  'phoneNumber': 081234623968,
                  'favoriteSport': 'Basketball',
                  'location': 'Jl. Ijen No 15, Malang',
                });
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/default_profile_picture.png'),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Get.to(ChatPage()); // Navigate to ChatPage
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for ?',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              // Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Football",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "DISCOUNT 50%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD3A335), // Gold Color
                            ),
                            child: const Text("Shop Now"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Image.network(
                      'https://storage.googleapis.com/a1aa/image/3OUjCAwahMazJJnar40uMMqHUYeeVUfzwqPCem5XkyPSq7OOB.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Brand Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Brand",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See all"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBrandIcon('assets/puma.png'),
                  _buildBrandIcon('assets/nike.png'),
                  _buildBrandIcon('assets/adidas.png'),
                  _buildBrandIcon('assets/reebok.png'),
                ],
              ),
              const SizedBox(height: 24),
              // New Arrival Section
              const Text(
                "New Arrival",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProductCard('Hard Ball', 'https://storage.googleapis.com/a1aa/image/yn3r6GAvaL7mLh39S46ch2lna6UVWTy8ySqb8wT0G1bpu74E.jpg', 10, 4.7),
                  _buildProductCard('Nike Free Run', 'https://storage.googleapis.com/a1aa/image/iGxpi5Mhm9rNJFMi7npM03qMEYUUxsOqXUe5UGNAf5yn6ujTA.jpg', 300, 4.9),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Set the current index
          onTap: _onItemTapped, // Handle taps
          selectedItemColor: const Color(0xFFD3A335), // Gold Color
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
  

  Widget _buildBrandIcon(String assetPath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String assetPath, int price, double rating) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            assetPath,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "\$ $price",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                "$rating/5",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {
              _addToWishlist(title);
            },
            child: const Text('Add to Wishlist'),
          ),
        ],
      ),
    );
  }  
}
