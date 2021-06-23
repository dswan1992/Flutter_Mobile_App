import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/waste_post.dart';

void submitPost(WastePost post) {
  FirebaseFirestore.instance.collection('posts').add({
    'imageURL': post.imageUrl,
    'quantity': post.quantity,
    'longitude': post.longitude,
    'latitude': post.latitude,
    'date': DateTime.now().toString(),
  });
}
