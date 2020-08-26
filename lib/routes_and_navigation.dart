import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'row_and_column.dart';
import 'stack_and_flexible.dart';
import 'text_rich_text.dart';
import 'text_field.dart';

class Router {
  static const String homeRoute = '/';
  static const String rowAndColumnRoute = '/rowAndColumn';
  static const String stackAndFlexibleRoute = '/stackAndFlexible';
  static const String textRoute = '/text';
  static const String textFieldRoute = '/textField';
  static const String routesAndNavigationRoute = '/routesAndNavigation';
  static const String routesAndNavigation2Route = '/routesAndNavigation2';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case rowAndColumnRoute:
        return MaterialPageRoute(
            builder: (_) => RowColumnContainerPage(settings.arguments));

      case stackAndFlexibleRoute:
        return MaterialPageRoute(
            builder: (_) => StackAndFlexiblePage(settings.arguments));

      case textRoute:
        return MaterialPageRoute(builder: (_) => TextPage(settings.arguments));

      case textFieldRoute:
        return MaterialPageRoute(
            builder: (_) => TextFieldPage(settings.arguments));

      case routesAndNavigationRoute:
        return MaterialPageRoute(
            builder: (_) => RouteAndNavigationPage(settings.arguments));

      case routesAndNavigation2Route:
        return MaterialPageRoute(
            builder: (_) => RouteAndNavigationPage2(settings.arguments));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: Text(MyApp.AppName),
                  ),
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class NavigationParameter {
  Map<String, dynamic> data;

  NavigationParameter() {
    data = new Map();
  }

  NavigationParameter.fromMap(this.data);

  NavigationParameter.fromJSON(String data) {
    // Todo: Handle the case of data is not JSON format
    this.data = json.decode(data);
  }

  @override
  String toString() {
    return jsonEncode(data);
  }
}

class RouteAndNavigationPage extends StatefulWidget {
  final String data;

  RouteAndNavigationPage(this.data);

  @override
  State<StatefulWidget> createState() => _RouteAndNavigationPageState(data);
}

class _RouteAndNavigationPageState extends State<RouteAndNavigationPage> {
  final String rawData;

  Map get data {
    return NavigationParameter.fromJSON(rawData).data;
  }

  _RouteAndNavigationPageState(this.rawData);

  final paramTextFieldController = new TextEditingController();
  String putBackParam = "";
  bool isPassParamClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data['title']),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton(
                child: Text('Test Incorrect Route'),
                onPressed: testIncorrectRoute,
              ),
              RaisedButton(
                child: Text('Back to Home'),
                onPressed: backToHome,
              ),
              TextField(
                controller: paramTextFieldController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0000ff))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffaaaaaa))),
                    hintText: 'parameter'),
              ),
              RaisedButton(
                child: Text('Pass Parameter'),
                onPressed: passParameter,
              ),
              Visibility(
                child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Center(child: Text('Received put back param:'))),
                visible: isPassParamClicked,
              ),
              Visibility(
                child: Center(child: Text(putBackParam)),
                visible: isPassParamClicked,
              )
            ],
          ),
        ));
  }

  testIncorrectRoute() {
    Navigator.pushNamed(context, 'incorrect route');
  }

  backToHome() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  passParameter() async {
    var navParam = new NavigationParameter();
    navParam.data.putIfAbsent('title', () => data['title'] + " 2");
    navParam.data.putIfAbsent('content', () => paramTextFieldController.text);

    var backParam = await Navigator.pushNamed(
        context, Router.routesAndNavigation2Route,
        arguments: navParam.toString());

    setState(() {
      isPassParamClicked = true;
      putBackParam =
          ["", null, false, 0].contains(backParam) ? 'no data' : backParam;
    });
  }
}

class RouteAndNavigationPage2 extends StatelessWidget {
  final String rawData;

  Map get data {
    return NavigationParameter.fromJSON(rawData).data;
  }

  RouteAndNavigationPage2(this.rawData);

  final putBackParamTextFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(data['title'])),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text('Received data:')),
                  Center(
                      child: Text(["", null, false, 0].contains(data['content'])
                          ? 'no data'
                          : data['content'])),
                  Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: TextField(
                        controller: putBackParamTextFieldController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0000ff))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffaaaaaa))),
                            hintText: 'parameter'),
                      )),
                  RaisedButton(
                    child: Text('Put Parameter Back'),
                    onPressed: () => {
                      Navigator.pop(
                          context, putBackParamTextFieldController.text)
                    },
                  )
                ])));
  }
}
