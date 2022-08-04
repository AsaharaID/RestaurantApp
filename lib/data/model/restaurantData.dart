import 'dart:convert';

class restaurantData {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;

  restaurantData({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  restaurantData.fromJson(Map<String, dynamic> restaurantdata) {
    id = restaurantdata['id'];
    name = restaurantdata['name'];
    description = restaurantdata['description'];
    pictureId = restaurantdata['pictureId'];
    city = restaurantdata['city'];
    rating = restaurantdata['rating'];

  }
}

List<restaurantData> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => restaurantData.fromJson(json)).toList();
}
