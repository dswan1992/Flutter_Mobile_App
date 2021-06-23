import 'Dart:io';

import 'package:flutter/material.dart';

import '../app_images.dart';
import '../../models/waste_post.dart';

class NewPostForm extends StatefulWidget {
  final File image;
  final WastePost post;
  final GlobalKey formKey;
  const NewPostForm({Key key, this.formKey, this.post, this.image});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<NewPostForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(image:widget.image),
          TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration:
                InputDecoration(hintText: 'Enter Number of Wasted Items'),
            validator: (value) {
              if (value.isEmpty || int.parse(value) <= 0) {
                return 'Please enter value greater than zero for'
                    ' wasted items';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              widget.post.wastedFood = int.parse(value);
            }
          ),
        ],
      ),
    );
  }
}
