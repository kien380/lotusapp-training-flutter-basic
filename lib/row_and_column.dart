import 'package:flutter/material.dart';
import 'routes_and_navigation.dart';

class RowColumnContainerPage extends StatefulWidget {
  final String rawData;

  RowColumnContainerPage(this.rawData);

  @override
  State<StatefulWidget> createState() => _RowColumnContainerPageState(rawData);
}

class _RowColumnContainerPageState extends State<RowColumnContainerPage> {
  final String rawData;
  Map get data {
    return NavigationParameter.fromJSON(rawData).data;
  }

  _RowColumnContainerPageState(this.rawData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xfff94144)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xfff3722c)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                        child: Text(
                          '2x',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(color: Color(0xfff8961e)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xfff9844a)),
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: Color(0xffd8f3dc)),
                  )),
                  Expanded(
                      flex: 2,
                      child: Row(children: [
                        Expanded(
                            child: Container(
                          child: Center(
                              child: Text('2x',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40))),
                          decoration: BoxDecoration(color: Color(0xffb7e4c7)),
                        )),
                        Container(
                            width: 200,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        'width = 200',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration:
                                        BoxDecoration(color: Color(0xff8900f2)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Color(0xffa100f2)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Color(0xffb100e8)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Color(0xffbc00dd)),
                                  ),
                                ),
                              ],
                            ))
                      ])),
                  Expanded(
                      child: Row(children: [
                    Expanded(
                        child: Container(
                      child: Center(
                        child: Text(
                          'spacing = 5   ---->',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      decoration: BoxDecoration(color: Color(0xff95d5b2)),
                    )),
                    Container(
                        width: 200,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffcc5803)),
                            )),
                            // Padding to replace the spacing
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Expanded(
                                child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffe2711d)),
                            )),
                            // Padding to replace the spacing
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Expanded(
                                child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffff9505)),
                            )),
                            // Padding to replace the spacing
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Expanded(
                                child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffffb627)),
                            )),
                            // Padding to replace the spacing
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Expanded(
                                child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xffffc971)),
                            )),
                          ],
                        ))
                  ])),
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                        child: Text(
                      'height = 100',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )),
                    decoration: BoxDecoration(color: Color(0xff74c69d)),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: Color(0xff52b788)),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: Color(0xff40916c)),
                  )),
                ],
              ))
        ],
      ),
    );
  }
}
