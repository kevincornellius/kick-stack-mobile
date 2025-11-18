// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  String price;
  String description;
  int stock;
  int? userId;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;
  String brand;
  String rating;
  String? thumbnail;
  bool isFeatured;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.stock,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.brand,
    required this.rating,
    required this.thumbnail,
    required this.isFeatured,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    stock: json["stock"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    category: categoryValues.map[json["category"]]!,
    brand: json["brand"],
    rating: json["rating"],
    thumbnail: json["thumbnail"],
    isFeatured: json["is_featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "stock": stock,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category": categoryValues.reverse[category],
    "brand": brand,
    "rating": rating,
    "thumbnail": thumbnail,
    "is_featured": isFeatured,
  };
}

enum Category { ACCESSORIES, BALL, GLOVES, JERSEY, SHOES, TRAINING }

final categoryValues = EnumValues({
  "accessories": Category.ACCESSORIES,
  "ball": Category.BALL,
  "gloves": Category.GLOVES,
  "jersey": Category.JERSEY,
  "shoes": Category.SHOES,
  "training": Category.TRAINING,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
