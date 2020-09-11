import 'package:flutter/material.dart';
import 'package:app1/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String AppName = 'LOTUS APP Training';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppName,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.homeRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Color(0xff043167),
    Color(0xff0652ab),
    Color(0xff0863ce),
    Color(0xff0974f0),
    Color(0xff2786f6),
    Color(0xff6badf9),
  ];

  List<HomePageItem> items;

  @override
  Widget build(BuildContext context) {
    initItems();
    setItemColor();
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.AppName),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () => {pushPage(context, index)},
                    child: Container(
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(items[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 25,
                            )),
                      )),
                      decoration: BoxDecoration(color: items[index].color),
                    ));
              })),
    );
  }

  initItems() {
    items = [
      HomePageItem.withNameAndRoute(
          'Row, Column, Container, Expanded', Router.rowAndColumnRoute),
      HomePageItem.withNameAndRoute(
          'Stack, Flexible, AspectRatio', Router.stackAndFlexibleRoute),
      HomePageItem.withNameAndRoute('Text, RichText', Router.textRoute),
      HomePageItem.withNameAndRoute('TextField', Router.textFieldRoute),
      HomePageItem.withNameAndRoute('Image, Button', Router.textRoute),
      HomePageItem.withNameAndRoute(
          'Checkbox, RadioButton, Slider, ProgressBar',
          Router.stackAndFlexibleRoute),
      HomePageItem.withNameAndRoute(
          'Routes & Navigation', Router.routesAndNavigationRoute),
      HomePageItem.withNameAndRoute(
          'RESTful, ListView', Router.restfulApiRoute),
    ];
  }

  setItemColor() {
    for (var i = 0; i < items.length; i++) {
      var colorIndex = (i ~/ 2) % colors.length;
      items[i].color = colors[colorIndex];
    }
  }

  pushPage(BuildContext context, int index) {
    var param = NavigationParameter();
    param.data.putIfAbsent('title', () => items[index].name);

    Navigator.pushNamed(context, items[index].route,
        arguments: param.toString());
  }
}

class HomePageItem {
  String name;
  Color color;
  String route;

  HomePageItem(this.name, this.color);

  HomePageItem.withName(String name) {
    this.name = name;
  }

  HomePageItem.withNameAndRoute(String name, String route) {
    this.name = name;
    this.route = route;
  }
}
