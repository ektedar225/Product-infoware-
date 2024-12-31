import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  // Method to build rating stars
  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(Icon(Icons.star, color: Colors.yellow, size: 16));
      } else if (i - rating < 1) {
        stars.add(Icon(Icons.star_half, color: Colors.yellow, size: 16));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.yellow, size: 16));
      }
    }
    return Row(
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                product.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  
                  // Product price
                  Text(
                    '\$${product.price}',
                    style: TextStyle(color: Colors.purple, fontSize: 14),
                  ),
                  SizedBox(height: 5),

                  // Conditionally render description and category only for larger screens
                  if (MediaQuery.of(context).size.width > 600) ...[
                    // Product description
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                      overflow: TextOverflow.ellipsis,  // Handle overflow with ellipsis
                      maxLines: 2,  // Limiting to 2 lines to avoid overflow
                    ),
                    SizedBox(height: 5),
                    // Product category
                    Text(
                      'Category: ${product.category}',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(height: 5),
                    // Product rating
                    _buildRatingStars(product.rating),
                    SizedBox(height: 5),
                    // Product stock
                    Text(
                      'In Stock: ${product.stock}',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
