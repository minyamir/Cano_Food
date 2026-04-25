import '../models/restaurant.dart';
import '../models/food.dart';

final List<Restaurant> dummyRestaurants = [
  Restaurant(
    id: 'r1', name: 'Burger Palace',
    imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=800',
    menu: [
      Food(id: 'f1', name: 'Zinger Burger', price: 450, imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400'),
      Food(id: 'f2', name: 'Cheese Fries', price: 220, imageUrl: 'https://images.unsplash.com/photo-1585109649139-366815a0d713?w=400'),
    ],
  ),
  Restaurant(
    id: 'r2', name: 'Pizza Corner',
    imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800',
    menu: [
      Food(id: 'f3', name: 'Pepperoni Feast', price: 1150, imageUrl: 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400'),
    ],
  ),
  Restaurant(
    id: 'r3', name: 'Habesha Kitchen',
    imageUrl: 'https://images.unsplash.com/photo-1541518763669-279f00ed51ca?w=800',
    menu: [
      Food(id: 'f5', name: 'Special Beyaynetu', price: 350, imageUrl: 'https://images.unsplash.com/photo-1651515434190-38827725838d?w=400'),
    ],
  ),
  Restaurant(
    id: 'r4', name: 'Sushi Zen',
    imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800',
    menu: [
      Food(id: 'f6', name: 'Salmon Roll', price: 800, imageUrl: 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=400'),
    ],
  ),
  Restaurant(
    id: 'r5', name: 'Pasta House',
    imageUrl: 'https://images.unsplash.com/photo-1473093226795-af9932fe5856?w=800',
    menu: [
      Food(id: 'f7', name: 'Lasagna', price: 600, imageUrl: 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=400'),
    ],
  ),
  Restaurant(
    id: 'r6', name: 'Steak & Grill',
    imageUrl: 'https://images.unsplash.com/photo-1546241072-48010ad28c2c?w=800',
    menu: [
      Food(id: 'f8', name: 'T-Bone Steak', price: 1500, imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=400'),
    ],
  ),
];