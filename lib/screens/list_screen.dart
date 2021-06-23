import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/empty_list_screen.dart';
import '../components/list_screen_components/post_list.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (content, snapshot) {
          if (snapshot.hasData &&
              snapshot.data.documents != null &&
              snapshot.data.documents.length > 0) {
            return Column(children: [
            PostList(length: snapshot.data.documents.length, posts: snapshot),
          ]);
          } else {
            return EmptyListScreenBody();
          }
        });
  }
}
