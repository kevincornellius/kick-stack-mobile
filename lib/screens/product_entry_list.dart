import 'package:flutter/material.dart';
import 'package:kick_stack/models/product_entry.dart';
import 'package:kick_stack/widgets/left_drawer.dart';
import 'package:kick_stack/screens/product_detail.dart';
import 'package:kick_stack/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool filterMyProducts;

  const ProductEntryListPage({super.key, this.filterMyProducts = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  bool _showMyProductsOnly = false;

  @override
  void initState() {
    super.initState();
    // Set initial filter state from the widget parameter
    _showMyProductsOnly = widget.filterMyProducts;
  }

  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Always fetch all products
    final response = await request.get('http://localhost:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  List<ProductEntry> _filterProducts(
    List<ProductEntry> products,
    CookieRequest request,
  ) {
    if (!_showMyProductsOnly) {
      return products;
    }

    final userId = request.jsonData['user_id'];

    if (userId == null) {
      return products; // If no user ID found, show all products
    }

    // Filter products where product.userId matches logged-in user's ID
    return products.where((product) => product.userId == userId).toList();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
        actions: [
          // Filter toggle button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 12.0,
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _showMyProductsOnly = !_showMyProductsOnly;
                });
              },
              icon: Icon(
                _showMyProductsOnly ? Icons.person : Icons.list,
                size: 18,
              ),
              label: Text(_showMyProductsOnly ? 'My Products' : 'All Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _showMyProductsOnly
                    ? Colors.blue.shade700
                    : Colors.grey.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in the product list yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              // Apply client-side filtering
              final allProducts = snapshot.data!;
              final products = _filterProducts(allProducts, request);

              if (products.isEmpty) {
                return const Center(
                  child: Text(
                    'No products found.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                );
              }

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: products[index],
                  onTap: () {
                    // Navigate to product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: products[index]),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
