import 'package:flutter/material.dart';

class EmptyListScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
