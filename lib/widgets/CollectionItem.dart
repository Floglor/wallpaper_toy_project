import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_toy_project/models/ListCollectionsResponse.dart';

class CollectionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final collection = Provider.of<CollectionResponse>(context, listen: false);

    // TODO: implement build
    return ClipRRect(
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: Image.network(collection.coverPhoto.urls.thumb),
        ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          collection.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
          },
          color: Theme.of(context).accentColor,
        ),
      ),),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
