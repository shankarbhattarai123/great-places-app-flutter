import 'dart:io';
import '../widgets/image_input.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../widgets/loaction_input.dart';

import 'package:flutter/material.dart';

class AddPlacescreen extends StatefulWidget {
  const AddPlacescreen({Key? key}) : super(key: key);

  @override
  _AddPlacescreenState createState() => _AddPlacescreenState();
}

class _AddPlacescreenState extends State<AddPlacescreen> {
  final _titleEditingController = TextEditingController();
  File? _pickedImage;
  void _selectimage(File pickedimage) {
    _pickedImage = pickedimage;
  }

  void _saveplace() {
    if (_titleEditingController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .add(_titleEditingController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New place"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageInput(_selectimage),
                      SizedBox(
                        height: 10,
                      ),
                      LocationInput(),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              onPressed: _saveplace,
              icon: Icon(Icons.add),
              label: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Add place",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            )
          ],
        ),
      ),
    );
  }
}
