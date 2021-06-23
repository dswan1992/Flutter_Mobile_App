import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/app_images.dart';
import '../models/waste_post.dart';


class DetailScreen extends StatelessWidget {
  final WastePost post;
  const DetailScreen({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post Details'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(DateFormat.yMMMMEEEEd().format(post.date),
                style: Theme.of(context).textTheme.headline4),
            AppImage(url:post.imageUrl),
            Text('Number of Wasted Items: ${post.quantity}',
                style: Theme.of(context).textTheme.headline6),
            Text('Location: (${post.latitude.toString()}, '
                '${post.longitude.toString()})'),
          ],
        ));
  }
}
