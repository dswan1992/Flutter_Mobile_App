class WastePost {
  DateTime date;
  int quantity;
  double latitude;
  double longitude;
  String imageUrl;

  WastePost() {
    quantity = 0;
    latitude = 0;
    longitude = 0;
    imageUrl = "null";
    date = DateTime.utc(1992, 11, 27);
  }

  WastePost.fromPost(dynamic post) {
    date = DateTime.parse(post['date']);
    quantity = post['quantity'];
    latitude = post['latitude'];
    longitude = post['longitude'];
    imageUrl = post['imageURL'];
  }

  set postUrl(String url) => imageUrl = url;
  set wastedFood(int waste) => quantity = waste;
  set postDate(DateTime post) => date = post;
  set postQuantity(int waste) => quantity = waste;

  void setPostValues(double desiredLongitude, double desiredLatitude) {
    longitude = desiredLongitude;
    latitude = desiredLatitude;
  }
}
