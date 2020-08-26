import 'package:flutter/material.dart';
import 'routes_and_navigation.dart';

class TextPage extends StatefulWidget {
  final String rawData;
  Map get data => NavigationParameter.fromJSON(rawData).data;
  TextPage(this.rawData);

  @override
  State<StatefulWidget> createState() => _TextPageState(data);
}

class _TextPageState extends State<TextPage> {
  Map data;
  _TextPageState(this.data);

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
                Text('This is a normal Text'),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  'This is a normal Text with TextStyle',
                  style: TextStyle(
                      color: Color(0xff7209b7),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      backgroundColor: Color(0xffffbe0b)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  'Normal Text with "Lobster" font \n(font này có hỗ trợ tiếng Việt)',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'This is ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'RichText ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(
                        text:
                            'that support multiple text styles on a single Text control, such as ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'italic text ',
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: 'or ', style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'underline text',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                    TextSpan(
                        text: ' or ', style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'bigger font size ',
                        style: TextStyle(color: Colors.black, fontSize: 23)),
                    TextSpan(
                        text: 'or ', style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'different font family ',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Lobster')),
                    TextSpan(
                        text: 'or ', style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'different color ',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                    TextSpan(
                        text:
                            'and many many different styles that you can customize in a single text control ',
                        style: TextStyle(color: Colors.black)),
                  ]),
                )
              ],
            )));
  }
}
