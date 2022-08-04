import 'package:dicoding_restaurant_app/common/styles.dart';
import 'package:dicoding_restaurant_app/ui/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_restaurant_app/data/model/restaurantData.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantListPage(),
    );
  }
}
