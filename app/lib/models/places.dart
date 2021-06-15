import 'dart:io';

class Location {
  final double lattitude;
  final double longitude;
  final String address;

  Location(this.lattitude, this.longitude, this.address);
}

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place(this.id, this.title, this.location, this.image);
}
