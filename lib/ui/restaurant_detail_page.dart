import 'package:dicoding_restaurant_app/data/model/restaurantData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail_page';

  final restaurantData restaurantdata;

  const RestaurantDetailPage({required this.restaurantdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurantdata.pictureId,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(restaurantdata.pictureId),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantdata.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.location_on_sharp,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: restaurantdata.city,
                          style: Theme.of(context).textTheme.overline,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.orange,
                    thickness: 1,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    restaurantdata.description,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.orange,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
