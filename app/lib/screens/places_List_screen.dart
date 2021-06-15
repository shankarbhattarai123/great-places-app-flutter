import 'package:flutter/material.dart';
import 'add_places_screen.dart';

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
        body: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
