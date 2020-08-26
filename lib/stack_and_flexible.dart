import 'package:flutter/material.dart';
import 'routes_and_navigation.dart';

class StackAndFlexiblePage extends StatelessWidget {
  final String rawData;
  Map get data => NavigationParameter.fromJSON(rawData).data;
  StackAndFlexiblePage(this.rawData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data['title']),
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(color: Color(0xff1a535c)),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Flexible(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xff03045e)),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 20, left: 20),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff023e8a)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 40, left: 40),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff0077b6)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 60, left: 60),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff0096c7)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 80, left: 80),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff00b4d8)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 100, left: 100),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff48cae4)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 120, left: 120),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff90e0ef)),
                                )),
                            flex: 1,
                          ),
                        ],
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Flexible(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xff03071e)),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 20, right: 20),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff370617)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 40, right: 40),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff6a040f)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 60, right: 60),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff9d0208)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 80, right: 80),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffd00000)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 100, right: 100),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffdc2f02)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(top: 120, right: 120),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffe85d04)),
                                )),
                            flex: 1,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Flexible(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xff081c15)),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20, left: 20),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff1b4332)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 40, left: 40),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff2d6a4f)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 60, left: 60),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff40916c)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 80, left: 80),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff52b788)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 100, left: 100),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff74c69d)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 120, left: 120),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff95d5b2)),
                                )),
                            flex: 1,
                          ),
                        ],
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Flexible(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xff774936)),
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20, right: 20),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff8a5a44)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 40, right: 40),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff9d6b53)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 60, right: 60),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffb07d62)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 80, right: 80),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffc38e70)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 100, right: 100),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffcd9777)),
                                )),
                            flex: 1,
                          ),
                          Flexible(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 120, right: 120),
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xffd69f7e)),
                                )),
                            flex: 1,
                          ),
                        ],
                      ),
                    )),
              ],
            )
          ]),
        ]));
  }
}
