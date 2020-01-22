import 'package:flutter/widgets.dart';
import 'package:wallpaper_toy_project/models/ListCollectionsResponse.dart';

class Collections with ChangeNotifier {
  List<CollectionResponse> collections;
}