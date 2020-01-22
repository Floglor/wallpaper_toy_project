/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pagination_helper/pagination_helper/event_model.dart';
import 'package:flutter_pagination_helper/pagination_helper/item_list_callback.dart';
import 'package:flutter_pagination_helper/pagination_helper/list_helper.dart';

class CustomProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PaginatedListWidget(
            progressWidget: Center(
              child: Text("Loading..."),
            ),
            itemListCallback: OnScrollCallback()),
      ),
    );
  }
}

class OnScrollCallback<T extends Widget> extends ItemListCallback {
  @override
  Future<EventModel<T>> getItemList() {
    // TODO: implement getItemList
    return null;
  }
}

class EventModel<T extends Widget> {
  final bool progress;
  final List<T> data;
  final String error;
  final bool stopLoading;

  EventModel({this.progress, this.data, this.error, this.stopLoading});
}*/