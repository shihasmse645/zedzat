// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    Products({
        required this.id,
        required this.categoryName,
        required this.categoryImage,
        required this.categoryType,
        required this.createdOn,
    });

    int? id;
    String categoryName;
    String categoryImage;
    CategoryType? categoryType;
    DateTime? createdOn;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryType: categoryTypeValues.map[json["category_type"]]!,
        createdOn: DateTime.parse(json["created_on"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_type": categoryTypeValues.reverse[categoryType],
        "created_on": createdOn!.toIso8601String(),
    };
}

enum CategoryType { PRODUCT }

final categoryTypeValues = EnumValues({
    "product": CategoryType.PRODUCT
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
