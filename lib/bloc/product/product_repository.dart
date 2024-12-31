import '../../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    // Simulating a network delay
    await Future.delayed(const Duration(seconds: 2));

    return [
      Product(
        id: 1,
        name: "Elegant Chair",
        price: 120.0,
        imageUrl: 'images/chair.jpg',
        description:
            "A sleek and comfortable chair with a modern design, perfect for your living room or office.",
        category: "Furniture",
        rating: 4.5,
        stock: 20,
      ),
      Product(
        id: 2,
        name: "Stylish Table",
        price: 700.0,
        imageUrl: 'images/table3.jpg',
        description:
            "A stylish wooden table with a polished finish, ideal for dining or working.",
        category: "Furniture",
        rating: 4.8,
        stock: 15,
      ),
      Product(
        id: 3,
        name: "Luxury Bed",
        price: 1500.0,
        imageUrl: 'images/bed.jpg',
        description:
            "A luxurious king-size bed with a premium mattress for ultimate comfort and style.",
        category: "Bedroom",
        rating: 4.9,
        stock: 10,
      ),
      Product(
        id: 4,
        name: "Beautiful Sofa",
        price: 1000.0,
        imageUrl: 'images/sofa.jpg',
        description:
            "A spacious and comfortable sofa with high-quality fabric, perfect for family gatherings.",
        category: "Living Room",
        rating: 4.7,
        stock: 8,
      ),
      Product(
        id: 5,
        name: "Luxury Curtains",
        price: 250.0,
        imageUrl: 'images/curtains.jpg',
        description:
            "Elegant curtains made from premium fabric, available in various colors to match your decor.",
        category: "Home Decor",
        rating: 4.6,
        stock: 30,
      ),
      Product(
        id: 6,
        name: "Stylish Dining Table",
        price: 900.0,
        imageUrl: 'images/dining.jpg',
        description:
            "A modern dining table set with 6 comfortable chairs, perfect for family meals and gatherings.",
        category: "Dining Room",
        rating: 4.8,
        stock: 5,
      ),
      Product(
        id: 7,
        name: "Cozy Recliner",
        price: 450.0,
        imageUrl: 'images/cozy.jpg',
        description:
            "A cozy recliner chair with adjustable back support and footrest, perfect for relaxation.",
        category: "Furniture",
        rating: 4.9,
        stock: 12,
      ),
      Product(
        id: 8,
        name: "Modern Lamp",
        price: 75.0,
        imageUrl: 'images/lamp.jpg',
        description:
            "A sleek and energy-efficient lamp with adjustable brightness, suitable for any room.",
        category: "Lighting",
        rating: 4.7,
        stock: 25,
      ),
      Product(
        id: 9,
        name: "Premium Carpet",
        price: 350.0,
        imageUrl: 'images/carpet.jpg',
        description:
            "A premium-quality carpet with intricate patterns, adding elegance to your living space.",
        category: "Home Decor",
        rating: 4.8,
        stock: 18,
      ),
      Product(
        id: 10,
        name: "Bookshelf",
        price: 200.0,
        imageUrl: 'images/bookshelf.jpg',
        description:
            "A sturdy and stylish bookshelf with multiple compartments to organize your books and decor items.",
        category: "Furniture",
        rating: 4.6,
        stock: 22,
      ),
    ];
  }
}
