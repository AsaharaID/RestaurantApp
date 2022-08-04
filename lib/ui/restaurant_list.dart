import 'package:dicoding_restaurant_app/common/styles.dart';
import 'package:dicoding_restaurant_app/data/model/restaurantData.dart';
import 'package:dicoding_restaurant_app/ui/restaurant_detail_page.dart';
import 'package:flutter/material.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<restaurantData> restaurantdata =
            parseRestaurant(snapshot.data);
        return ListView.builder(
          itemCount: restaurantdata.length,
          itemBuilder: (context, index) {
            return _buildRestaurantItem(context, restaurantdata[index]);
          },
        );
      },
    );
  }

  Widget _buildRestaurantItem(
      BuildContext context, restaurantData restaurantdata) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      constraints: BoxConstraints(
        minHeight: 100,
        minWidth: double.infinity,
        maxHeight: 130,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Material(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            leading: Hero(
              tag: restaurantdata.pictureId,
              child: Container(
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(restaurantdata.pictureId),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    restaurantdata.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    '⭐ ' + restaurantdata.rating,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                RestaurantDetailPage.routeName,
                arguments: restaurantdata,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.75),
                BlendMode.modulate,
              ),
              image: AssetImage('assets/resto.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.orange[800],
        toolbarHeight: 150,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Restaurant',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Recommendation restaurant for ya!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: _buildList(context),
    );
  }
}
