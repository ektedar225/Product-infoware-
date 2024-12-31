import 'package:flutter/material.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/product/product_event.dart';
import '../bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/product_item.dart';
import '../bloc/product/product_repository.dart';
import 'user_form_screen.dart';
import 'audio_player_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(  // Wrapping the entire body in SingleChildScrollView
        child: Column(
          children: [
            // Navigation Buttons Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserFormScreen()),
                      );
                    },
                    child: Text('Go to Form'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 212, 209, 212),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
                      );
                    },
                    child: Text('Audio Player'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 212, 209, 212),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
            // Products Section
            BlocProvider(
              create: (context) =>
                  ProductBloc(ProductRepository())..add(FetchProducts()),
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        // Adjust grid layout based on screen width
                        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                        return GridView.builder(
                          padding: const EdgeInsets.all(16.0),
                          shrinkWrap: true,  // Ensures grid only takes as much space as needed
                          physics: NeverScrollableScrollPhysics(),  // Prevents the GridView from scrolling
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return ProductItem(product: state.products[index]);
                          },
                        );
                      },
                    );
                  } else if (state is ProductError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      'Welcome to Product App',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
