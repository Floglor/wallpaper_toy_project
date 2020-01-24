import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../models/Collections.dart';
import 'CollectionItem.dart';

class CollectionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Collections _collectionProvider = Provider.of<Collections>(context);

    return GridView.builder(
      itemCount:  _collectionProvider.results == null ? 0 : _collectionProvider.results.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: _collectionProvider.results == null ? null : _collectionProvider.results[i],
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
