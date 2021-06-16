import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_places_screen.dart';
import '../providers/great_places.dart';

class PlacesList extends StatelessWidget {
  // const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPlacescreen()),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, place, ch) {
          return place.items.length <= 0
              ? Center(
                  child: Text(
                  "No any places added!",
                  style: TextStyle(fontSize: 22),
                ))
              : ListView.builder(
                  itemCount: place.items.length,
                  itemBuilder: (ctx, i) => InkWell(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 4,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.file(
                                      place.items[i].image,
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Container(
                                          width: 350,
                                          color: Colors.black45,
                                          child: Text(
                                            place.items[i].title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          )))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
        },
      ),
    );
  }
}
