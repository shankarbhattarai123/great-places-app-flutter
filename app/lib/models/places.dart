import 'dart:io';

// class Location {
//   final double lattitude;
//   final double longitude;
//   final String address;

//   Location(
//       {this.lattitude = 1.00, this.longitude = 1.00, this.address = "butwal"});
// }

class Place {
  final String id;
  final String title;
  // final Location location;
  final File image;

  Place(this.id, this.title, this.image);
}
//this.location,
