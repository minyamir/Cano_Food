import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ensure these paths match your folder names exactly
import './providers/cart_provider.dart';
import './screens/home/home_screen.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canon Food App',
      theme: ThemeData(
        // Tip: Use ColorScheme for Material 3 instead of primarySwatch
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: HomeScreen(), 
    );
  }
}