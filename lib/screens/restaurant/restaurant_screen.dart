import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/restaurant.dart';
import '../../providers/cart_provider.dart';
import '../cart/cart_screen.dart'; // Make sure this exists!
import '../home/home_screen.dart'; // For dummy data access if needed
class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FLOATING CART BUTTON: Makes it look like a real app
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) =>  CartScreen()),
          );
        },
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.shopping_basket, color: Colors.white),
        label: Consumer<CartProvider>(
          builder: (context, cart, child) => Text(
            "View Cart (${cart.items.length})",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            iconTheme: const IconThemeData(color: Colors.white), // Back button color
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                restaurant.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)], // Makes text readable
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    restaurant.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, _, __) => Container(color: Colors.orange[200]),
                  ),
                  // GRADIENT OVERLAY: This is the "Secret Sauce" for attractive UI
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black54, Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 80), // bottom padding for FAB
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final food = restaurant.menu[index];
                  return _buildFoodItem(context, food);
                },
                childCount: restaurant.menu.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, dynamic food) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5, spreadRadius: 1)],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            food.imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (ctx, _, __) => const Icon(Icons.fastfood, size: 40),
          ),
        ),
        title: Text(food.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Deliciously prepared", style: TextStyle(fontSize: 12)),
            const SizedBox(height: 5),
            Text("${food.price} ETB", 
                style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.orange, size: 32),
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).addToCart(food);
            // Feedback
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${food.name} added!"), duration: const Duration(seconds: 1)),
            );
          },
        ),
      ),
    );
  }
}