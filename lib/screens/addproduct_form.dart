import 'package:flutter/material.dart';
import 'package:kick_stack/screens/menu.dart';
import 'package:kick_stack/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:kick_stack/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "shoes";
  String _thumbnail = "";
  String _brand = "";
  int _stock = 0;
  String _rating = "0.0";
  bool _isFeatured = false;

  final List<Map<String, String>> _categories = [
    {"value": "shoes", "label": "Football Shoes"},
    {"value": "jersey", "label": "Jerseys & Kits"},
    {"value": "ball", "label": "Footballs"},
    {"value": "gloves", "label": "Goalkeeper Gloves"},
    {"value": "accessories", "label": "Accessories"},
    {"value": "training", "label": "Training Equipment"},
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Add New Product'),
        backgroundColor: const Color(0xFF0066FF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const Text(
                  'Product Information',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Fill in all the details about your product',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),

                // Product Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Product Name *",
                    hintText: "e.g., Nike Mercurial Vapor 15",
                    prefixIcon: const Icon(Icons.shopping_bag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() => _name = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Product name is required!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Brand
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Brand *",
                    hintText: "e.g., Nike, Adidas, Puma",
                    prefixIcon: const Icon(Icons.branding_watermark),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() => _brand = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Brand is required!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Category
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category *",
                    prefixIcon: const Icon(Icons.category),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem<String>(
                          value: cat["value"],
                          child: Text(cat["label"]!),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _category = value!),
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Description *",
                    hintText: "Detailed product description",
                    prefixIcon: const Icon(Icons.description),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description is required!";
                    }
                    if (value.length < 10) {
                      return "Description must be at least 10 characters!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Price and Stock Row
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Price *",
                          hintText: "0",
                          prefixText: "Rp ",
                          prefixIcon: const Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            setState(() => _price = int.tryParse(value) ?? 0),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required!";
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) <= 0) {
                            return "Invalid price!";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Stock *",
                          hintText: "0",
                          prefixIcon: const Icon(Icons.inventory),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            setState(() => _stock = int.tryParse(value) ?? 0),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required!";
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) < 0) {
                            return "Invalid!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Rating
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Rating (0.0 - 5.0) *",
                    hintText: "e.g., 4.5",
                    prefixIcon: const Icon(Icons.star),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (value) => setState(() => _rating = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Rating is required!";
                    }
                    final rating = double.tryParse(value);
                    if (rating == null || rating < 0 || rating > 5) {
                      return "Rating must be between 0.0 and 5.0!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Thumbnail URL
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Thumbnail URL",
                    hintText: "https://example.com/image.jpg",
                    prefixIcon: const Icon(Icons.image),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() => _thumbnail = value),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!value.startsWith('http://') &&
                          !value.startsWith('https://')) {
                        return "URL must start with http:// or https://";
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Featured Switch
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SwitchListTile(
                    title: const Text(
                      "Featured Product",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text("Display this product prominently"),
                    value: _isFeatured,
                    onChanged: (value) => setState(() => _isFeatured = value),
                    activeColor: const Color(0xFF0066FF),
                  ),
                ),
                const SizedBox(height: 32),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Save Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode({
                            "name": _name,
                            "description": _description,
                            "price": _price,
                            "stock": _stock,
                            "brand": _brand,
                            "rating": _rating,
                            "thumbnail": _thumbnail,
                            "category": _category,
                            "is_featured": _isFeatured,
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Product successfully saved!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  response['message'] ??
                                      "Failed to save product!",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
