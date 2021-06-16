import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;
  ImageInput(this.onSelectedImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _storedImage = File(pickedFile!.path);
    });
    final path = await getApplicationDocumentsDirectory();
    final fileName = basename(pickedFile!.path);
    final File localImage = await _storedImage!.copy('$path/$fileName.jpeg');
    widget.onSelectedImage(localImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image selected!",
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: FlatButton.icon(
          onPressed: getImage,
          icon: Icon(Icons.camera),
          label: Text("Take a picture"),
        ))
      ],
    );
  }
}
