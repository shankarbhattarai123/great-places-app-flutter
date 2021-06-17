import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _locationImageURL;
  Future<void> getLocation() async {
    final locdata = await Location().getLocation();
    print(locdata.latitude);
    print(locdata.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: _locationImageURL == null
                ? Center(
                    child: Text("No location selected"),
                  )
                : Center(child: Image.network(_locationImageURL!))),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: getLocation,
              icon: Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              label: Text(
                "Current Location",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.map,
                color: Colors.blue,
              ),
              label: Text(
                "select on map",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
