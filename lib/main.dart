import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_toy_project/models/Collections.dart';
import 'dart:convert' as convert;

import 'package:wallpaper_toy_project/models/UnsplashResponse.dart';

void main() => runApp(MyApp());

final maximumPagesSnackBar = SnackBar(
  content: Text('Maximum page limit '),
  action: SnackBarAction(
    label: 'Mkay',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Deo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _url = 'api.unsplash.com';
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Wallpapers');
  List<Image> _imageList = new List();
  int _pageNumber = 1;
  int _picPerPage = 15;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;
  String _lastQuery = '';
  bool _isReachedMxaimunCtapacipy = false;
  int _pageLimit = 2;






  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageNumber = 1;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _lastQuery != '' &&
          !_isReachedMxaimunCtapacipy) {
        _getURLs(_lastQuery);
        print(
            'scrollController detected a scroll attempt, loading page $_pageNumber');
      }
    });
  }

  static void logPrint(Object object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
      print(object);
    } else {
      String log = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(log.substring(start, logLength));
      }
    }
  }

  void _getURLs(String query) async {
    if (_pageNumber < _pageLimit + 1) {
      if (_pageNumber == _pageLimit) {
        _isReachedMxaimunCtapacipy = true;
      }
      _isLoading = true;
      var tempURL = _url;
      var queryParameters = {
        'client_id':
            '6ad580c53eea070237d2cea2ab9c06c92a0751e55f3eff65b3dc3d9975d2abb2',
        'query': query,
        'per_page': _picPerPage.toString(),
        'page': _pageNumber.toString()
      };
      var uri = Uri.https(tempURL, '/search/photos/', queryParameters);
      var response = await http.get(uri);
      var jsonResponse = convert.jsonDecode(response.body);
      var fetchedResponse = UnsplashImages.fromJson(jsonResponse);
      logPrint(fetchedResponse.results[0].urls.raw);
      _pageNumber++;

      setState(() {
        for (int i = 0; i < fetchedResponse.results.length; i++) {
          _imageList
              .add(new Image.network(fetchedResponse.results[i].urls.thumb));
        }
        _isLoading = false;
        //logPrint(convert.jsonEncode(jsonResponse));
        //logPrint("response: " + jsonResponse.toString());
        //print("response(raw): " + response.data["raw"].toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Collections())
        ],
        child: MaterialApp(
            home: DefaultTabController(
                length: 2,
                child: Scaffold(
                    appBar: AppBar(
                      title: _appBarTitle,
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            if (this._searchIcon.icon == Icons.search) {
                              this._searchIcon = new Icon(Icons.close);
                              this._appBarTitle = new TextField(
                                onSubmitted: (text) {
                                  if (_lastQuery != text) {
                                    _pageNumber = 1;
                                    _imageList.clear();
                                    _isReachedMxaimunCtapacipy = false;
                                  }
                                  _getURLs(text);
                                  _lastQuery = text;
                                },
                                decoration: new InputDecoration(
                                    prefixIcon: new Icon(Icons.search),
                                    hintText: 'Search...'),
                              );
                            } else {
                              this._searchIcon = new Icon(Icons.search);
                              this._appBarTitle = new Text('Search Example');
                            }
                          });
                        },
                        icon: _searchIcon,
                      ),
                      bottom: TabBar(
                        tabs: <Widget>[
                          Tab(icon: Icon(Icons.image)),
                          Tab(icon: Icon(Icons.accessible_forward)),
                        ],
                      ),
                    ),
                    body: TabBarView(children: [
                      Container(
                        child: GridView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(10.0),
                          itemCount: _imageList.length,
                          itemBuilder: (ctx, i) => Image(
                            image: _imageList[i].image,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            //childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        ),
                        // child: _buildList(),
                      ),
                      Icon(Icons.accessible)
                    ])
                )
            )
        )
    );
  }
}
