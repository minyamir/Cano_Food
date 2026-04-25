import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200'),
          ),
          const SizedBox(height: 15),
          const Text("Elias Melaku", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("elias@example.com", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileItem(Icons.history, "My Orders"),
                _buildProfileItem(Icons.favorite_border, "Favorites"),
                _buildProfileItem(Icons.location_on_outlined, "Shipping Address"),
                _buildProfileItem(Icons.payment, "Payment Methods"),
                const Divider(),
                _buildProfileItem(Icons.logout, "Logout", color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, {Color color = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}