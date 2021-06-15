import 'dart:io';
import '../widgets/image_input.dart';

import 'package:flutter/material.dart';

class AddPlacescreen extends StatefulWidget {
  const AddPlacescreen({Key? key}) : super(key: key);

  @override
  _AddPlacescreenState createState() => _AddPlacescreenState();
}

class _AddPlacescreenState extends State<AddPlacescreen> {
  final _titleEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New place"),
      ),
      body: Column(
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
                    Row(
                      children: [ImageInput()],
                    )
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {},
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
    );
  }
}
