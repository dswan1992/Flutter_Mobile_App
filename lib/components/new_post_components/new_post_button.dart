import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../models/waste_post.dart';
import '../new_post_components/new_post.dart';

class NewPostButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final WastePost post;
  const NewPostButton({Key key, this.formKey, this.post}) : super(key: key);
  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<NewPostButton> {
  LocationData locationData;

  Future<void> retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Button for submitting a food waste post',
      button: true,
      onTapHint: 'Press to submit a food waste post',
      child: SizedBox(
          height: 80,
          width: double.infinity,
          child: 
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.cloud_upload_outlined, size: 50),
              onPressed: () async {
                if (widget.formKey.currentState.validate()) {
                  widget.formKey.currentState.save();
                  await retrieveLocation();
                  widget.post.setPostValues(
                      locationData.longitude, locationData.latitude);
                  submitPost(widget.post);
                  Navigator.of(context).pop();
                }
              }
            )
          ),
    );
  }
}
