import 'food.dart';

class Order {
  final String id;
  final List<Food> items;
  final double total;
  String status; // 'pending', 'preparing', 'on_the_way', 'delivered'

  Order({
    required this.id, 
    required this.items, 
    required this.total, 
    this.status = "pending"
  });
}