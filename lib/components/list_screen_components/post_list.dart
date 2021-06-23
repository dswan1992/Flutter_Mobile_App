import 'package:flutter/material.dart';

import 'list_tile.dart';
import '../../models/waste_post.dart';


class PostList extends StatefulWidget {
  final int length;
  final dynamic posts;
  const PostList({Key key, this.length, this.posts})
      : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.length,
          itemBuilder: (context, index) {
            var post = widget.posts.data.documents[index];
            WastePost waste = WastePost.fromPost(post);
            return Semantics(
              label: 'Post of Wasted food',
              onTapHint: 'Takes you to the Food Waste Post Detail Screen',
              
              child: EntryTile(post: waste));
          }),
    );
  }
}
