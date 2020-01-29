import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_toy_project/models/CollectionPhotoList.dart';

class CollectionImagesGrid extends StatelessWidget {

  static const String routeName = "CollectionsGrid";

  getCollectionPhotoList() async {

  }

  @override
  Widget build(BuildContext context) {
    // Collections _collectionProvider = Provider.of<Collections>(context);
    CollectionPhotoList collectionPhotoList =
        Provider.of<CollectionPhotoList>(context);

    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
          itemCount: collectionPhotoList.photos.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // builder: (c) => products[i],
            value: collectionPhotoList.photos[i],
            child: Image.network(collectionPhotoList.photos[i].urls.thumb),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ));
  }
}
