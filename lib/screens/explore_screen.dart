import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Ethiopian', 'image': 'https://images.unsplash.com/photo-1541518763669-279f00ed51ca?w=400', 'items': '12 Places'},
      {'name': 'Burgers', 'image': 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400', 'items': '15 Places'},
      {'name': 'Pizza', 'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400', 'items': '20 Places'},
      {'name': 'Sushi', 'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400', 'items': '8 Places'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Explore", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, i) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(categories[i]['image']),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(categories[i]['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Text(categories[i]['items'], style: const TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}