import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_toy_project/models/ListCollectionsResponse.dart';
import '../models/Collections.dart';
import 'CollectionItem.dart';

class CollectionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Collections _collectionProvider = Provider.of<Collections>(context);
    List<CollectionResponse> collections = _collectionProvider.collections;

    return GridView.builder(
      itemCount: collections.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: collections[i],
        child: CollectionItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
