import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../restaurant/restaurant_screen.dart';
import '../../models/restaurant.dart';
import '../explore_screen.dart';
import '../cart_screen.dart';
import '../profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Class 1: The Wrapper that switches between screens
  final List<Widget> _pages = [
    const HomeContent(),   // The main scrolling UI
    const ExploreScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: _pages[_selectedIndex], // Shows the current screen
      bottomNavigationBar: _buildModernBottomNav(),
    );
  }

  Widget _buildModernBottomNav() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color.fromARGB(255, 116, 31, 2),
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_rounded), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

// Class 2: The actual scrolling Home Content (Header, Slider, Restaurants)
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Restaurant> _foundRestaurants = [];

  @override
  void initState() {
    _foundRestaurants = dummyRestaurants;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      _foundRestaurants = dummyRestaurants
          .where((res) => res.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPremiumHeader(),
          const SizedBox(height: 50),
          _buildSectionHeader("Trending Now 🔥"),
          _buildFoodSlider(),
          const SizedBox(height: 25),
          _buildSectionHeader("Categories"),
          _buildCategoryList(),
          const SizedBox(height: 25),
          _buildSectionHeader("Popular Near You"),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            itemCount: _foundRestaurants.length,
            itemBuilder: (ctx, index) => _buildRestaurantCard(context, _foundRestaurants[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 116, 31, 2), Color.fromARGB(255, 160, 40, 5)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.fastfood, color: Colors.orange, size: 30),
                    SizedBox(width: 10),
                    Text('Canon Food', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.2)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Delicious food delivered to your door", style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -28,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 8))],
            ),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                hintText: "Search for your favorite dishes...",
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.orange),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
    );
  }

  Widget _buildFoodSlider() {
    final trendingImages = [
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500',
      'https://images.unsplash.com/photo-1543353071-10c8ba85a904?w=500',
      'https://images.unsplash.com/photo-1476224488681-aba355378f78?w=500',
    ];
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, top: 10),
        itemCount: trendingImages.length,
        itemBuilder: (ctx, i) => Container(
          width: 300,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(trendingImages[i]), fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.6), Colors.transparent]),
            ),
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Align(alignment: Alignment.bottomLeft, child: Text("50% OFF TODAY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = ["🍔 Burger", "🍕 Pizza", "🍣 Sushi", "🍝 Pasta", "🥩 Steak"];
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, top: 10),
        itemCount: categories.length,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(child: Text(categories[i], style: const TextStyle(fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RestaurantScreen(restaurant: restaurant)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(restaurant.imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      const Text("Free Delivery • 20-30 min", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                    child: const Text("4.5 ★", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}