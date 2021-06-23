import 'package:flutter/material.dart';

import '../empty_list_screen.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Post'), centerTitle: true),
        body: EmptyListScreenBody());
  }
}
