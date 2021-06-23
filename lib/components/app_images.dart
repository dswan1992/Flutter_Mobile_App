import 'Dart:io';

import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String url;
  final File image;
  AppImage({Key key, this.url, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Semantics(
        label: 'A picture of food waste',
        image: true,
        child: SizedBox(height: 200, width: 200, child: Image.file(image)));
    }else{
      return Semantics(
        label: 'A picture of food waste',
        image: true,
        child: SizedBox(height: 300, width: 300, child: Image.network(url)));
    }
  }
}
