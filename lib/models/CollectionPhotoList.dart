import 'package:flutter/cupertino.dart';
import 'package:wallpaper_toy_project/models/CollectionPhotos.dart';

class CollectionPhotoList with ChangeNotifier {
  List<CollectionPhoto> photos;


  CollectionPhotoList(this.photos);

  factory CollectionPhotoList.fromJson(List<dynamic> json) =>
      CollectionPhotoList(json.map((e) => CollectionPhoto.fromJson(e)).toList());

}