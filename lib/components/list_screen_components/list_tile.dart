import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/waste_post.dart';
import '../../screens/post_details_screen.dart';

class EntryTile extends StatelessWidget {
  final WastePost post;
  const EntryTile({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(DateFormat.yMMMMEEEEd().format(post.date),
        style: Theme.of(context).textTheme.headline5),
        trailing: Text(post.quantity.toString(),
            style: Theme.of(context).textTheme.headline4),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(post: post)));
        });
  }
}
