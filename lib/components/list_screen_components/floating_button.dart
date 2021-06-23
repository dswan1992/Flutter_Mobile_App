import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens/new_post_screen.dart';



class ListScreenButton extends StatelessWidget {
 
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    File image;

    Future<void> getImage(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    }

    return Semantics(
      onTapHint:'Select a photo',
      button: true,
      label: 'Button for choosing photo for a new post',
      child: SizedBox(
          height: 80,
          width: double.infinity,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.camera_alt_outlined,
            size: 50),
            onPressed: () async {
              await getImage(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewPostScreen(image: image)
                )
              );
            }
          ),
      ),
    );
  }
}
