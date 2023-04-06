// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

List<Services> servicesFromJson(String str) => List<Services>.from(json.decode(str).map((x) => Services.fromJson(x)));

String servicesToJson(List<Services> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services {
    Services({
        required this.id,
        required this.categoryName,
        required this.categoryImage,
        required this.categoryType,
        required this.createdOn,
    });

    int id;
    String categoryName;
    String categoryImage;
    CategoryType categoryType;
    DateTime createdOn;

    factory Services.fromJson(Map<String, dynamic> json) => Services(
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
        "created_on": createdOn.toIso8601String(),
    };
}

enum CategoryType { SERVICE }

final categoryTypeValues = EnumValues({
    "service": CategoryType.SERVICE
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
