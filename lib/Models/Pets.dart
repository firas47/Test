// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

class Pets {
  Pets({
    required this.id,
    required this.category,
    required this.name,
    required this.photoUrls,
    required this.tags,
    required this.status,
  });

  int id;
  Category category;
  String? name;
  List<String>? photoUrls;
  List<Category>? tags;
  String? status;

  factory Pets.fromJson(Map<String, dynamic> json) => Pets(
    id: json["id"],
    category: Category.fromJson(json["category"]),
    name: json["name"],
    photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
    tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category.toJson(),
    "name": name,
    "photoUrls": List<dynamic>.from(photoUrls!.map((x) => x)),
    "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
    "status": status,
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
