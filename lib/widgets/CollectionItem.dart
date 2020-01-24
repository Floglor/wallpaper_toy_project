import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_toy_project/models/Collections.dart';

class CollectionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final results = Provider.of<Results>(context, listen: false);

    // TODO: implement build
    return ClipRRect(
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: Image.network(results.coverPhoto.urls.thumb,  fit: BoxFit.cover),
        ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          results.title,
          textAlign: TextAlign.center,
        ),
      ),),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
