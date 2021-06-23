import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../components/new_post_components/new_post.dart';
import '../models/waste_post.dart';


class NewPostScreen extends StatefulWidget {
  final File image;
  const NewPostScreen({Key key, this.image}) : super(key: key);
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String url;
  WastePost post = WastePost();
  @override
  void initState() {
    super.initState();
    retrievePhotoURL();
  }

  void retrievePhotoURL() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(DateTime.now().toString());
    StorageUploadTask uploadTask = storageReference.putFile(widget.image);
    await uploadTask.onComplete;
    url = await storageReference.getDownloadURL();
    setState(() {});
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return LoadingScreen();
    } else {
      post.postUrl = url;
      return Scaffold(
        appBar: AppBar(title: Text('New Post'), centerTitle: true),
        body: SingleChildScrollView(
            child:
                NewPostForm(formKey: formKey, post: post, image: widget.image)),
        floatingActionButton: NewPostButton(formKey: formKey, post: post),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
  }
}
