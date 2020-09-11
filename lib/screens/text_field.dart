import 'package:flutter/material.dart';
import 'routes_and_navigation.dart';

class TextFieldPage extends StatefulWidget {
  final String rawData;
  Map get data => NavigationParameter.fromJSON(rawData).data;
  TextFieldPage(this.rawData);

  @override
  State<StatefulWidget> createState() => _TextFieldPageState(data);
}

class _TextFieldPageState extends State<TextFieldPage> {
  Map data;
  _TextFieldPageState(this.data);

  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller4 = TextEditingController();

  String text1 = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data['title']),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildController1Example(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              buildController2Example(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              buildController3Example(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              buildController4Example(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              buildController5Example(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              buildTextFieldOtpExample(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              buildTextFieldCustomCursor(),
            ],
          ),
        )));
  }

  Widget buildController1Example() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller1,
            decoration: InputDecoration(hintText: 'Enter & click OK'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 40,
                child: RaisedButton(
                  onPressed: () => {
                    setState(() => {text1 = controller1.text})
                  },
                  padding: EdgeInsets.all(2),
                  child: Text('OK'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              Expanded(
                child:
                    Text([null, ''].contains(text1) ? '(result here)' : text1),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildController2Example() {
    controller2.addListener(() {
      setState(() {
        text2 = controller2.text;
      });
    });

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller2,
            decoration: InputDecoration(hintText: 'addListener'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: Text([null, ''].contains(text2) ? '(result here)' : text2),
        )
      ],
    );
  }

  Widget buildController3Example() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) => {
              setState(() => {text3 = value})
            },
            decoration: InputDecoration(hintText: 'onChanged (value)'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: Text([null, ''].contains(text3) ? '(result here)' : text3),
        )
      ],
    );
  }

  Widget buildController4Example() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller4,
            onEditingComplete: () => {
              setState(() => {text4 = controller4.text})
            },
            decoration: InputDecoration(hintText: 'onEditingComplete'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: Text([null, ''].contains(text4) ? '(result here)' : text4),
        )
      ],
    );
  }

  Widget buildController5Example() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onSubmitted: (value) => {
              setState(() => {text5 = value})
            },
            decoration: InputDecoration(hintText: 'onSubmitted (value)'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: Text([null, ''].contains(text5) ? '(result here)' : text5),
        )
      ],
    );
  }

  Widget buildTextFieldOtpExample() {
    FocusNode node1 = FocusNode();
    FocusNode node2 = FocusNode();
    FocusNode node3 = FocusNode();
    FocusNode node4 = FocusNode();
    FocusNode node5 = FocusNode();
    FocusNode node6 = FocusNode();

    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: node1,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(counterText: ''),
            onChanged: (value) =>
                {if (value != '') FocusScope.of(context).requestFocus(node2)},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: TextField(
            focusNode: node2,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(counterText: ''),
            onChanged: (value) => {
              if (value == '')
                FocusScope.of(context).requestFocus(node1)
              else
                FocusScope.of(context).requestFocus(node3)
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: TextField(
            focusNode: node3,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(counterText: ''),
            onChanged: (value) => {
              if (value == '')
                FocusScope.of(context).requestFocus(node2)
              else
                FocusScope.of(context).requestFocus(node4)
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: TextField(
            focusNode: node4,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(counterText: ''),
            onChanged: (value) => {
              if (value == '')
                FocusScope.of(context).requestFocus(node3)
              else
                FocusScope.of(context).requestFocus(node5)
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: TextField(
            focusNode: node5,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(counterText: ''),
            onChanged: (value) => {
              if (value == '')
                FocusScope.of(context).requestFocus(node4)
              else
                FocusScope.of(context).requestFocus(node6)
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: TextField(
            focusNode: node6,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(counterText: ''),
            onChanged: (value) =>
                {if (value == '') FocusScope.of(context).requestFocus(node5)},
          ),
        )
      ],
    );
  }

  Widget buildTextFieldCustomCursor() {
    return TextField(
      decoration: InputDecoration(hintText: 'Custom cursor'),
      cursorColor: Colors.red,
      cursorWidth: 12,
      cursorRadius: Radius.zero,
    );
  }
}
