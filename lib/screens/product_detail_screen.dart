import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 24));
      } else if (i - rating < 1) {
        stars.add(Icon(Icons.star_half, color: Colors.yellow, size: 24));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.yellow, size: 24));
      }
    }
    return Row(
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  product.imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              
              // Product Name and Price
              Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Price: \$${product.price}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 10),
              Text(
                'Product ID: ${product.id}',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              
              // Product Description
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                product.description,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),

              // Product Category
              Text(
                'Category: ${product.category}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 10),

              // Product Rating
              Text(
                'Rating: ',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 5),
              _buildRatingStars(product.rating),
              SizedBox(height: 10),

              // Product Stock
              Text(
                'Stock Available: ${product.stock}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
