import 'package:app1/models/student.dart';
import 'package:flutter/material.dart';
import 'package:app1/screens/routes_and_navigation.dart';
import 'package:app1/services/restful_service.dart';
import 'dart:convert';

class RestfulApiPage extends StatefulWidget {
  final String rawData;
  Map get data => NavigationParameter.fromJSON(rawData).data;
  RestfulApiPage(this.rawData);

  @override
  State<StatefulWidget> createState() => _RestfulApiPageState(data);
}

class _RestfulApiPageState extends State<RestfulApiPage> {
  final Map data;
  _RestfulApiPageState(this.data);

  String requestStatus = '';
  String firstname = '';
  String lastname = '';

  List students = List<Student>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildStudentInfoForm(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              buildListStudent()
            ],
          )),
    );
  }

  Widget buildStudentInfoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) => {firstname = value},
          decoration: InputDecoration(hintText: 'Firstname'),
        ),
        TextField(
          onChanged: (value) => {lastname = value},
          decoration: InputDecoration(hintText: 'Lastname'),
        ),
        RaisedButton(
          onPressed: submitStudentInfo,
          child: Text('Submit'),
        ),
        Center(
            child: Text(
          requestStatus,
          style: TextStyle(color: Colors.black),
        ))
      ],
    );
  }

  Widget buildListStudent() {
    // Test
    String textData = '';
    for (var s in students) textData += s.firstname + ' ' + s.lastname + '\n';
    return Text(textData);

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                color: index.isOdd ? Color(0xffe5e5e5) : Color(0xffd8f3dc)),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(students[index].fistname +
                        ' ' +
                        students[index].lastname)
                  ],
                )),
          ),
        );
      },
    );
  }

  submitStudentInfo() async {
    if (['', null].contains(firstname)) {
      setState(() {
        requestStatus = 'Please enter first name';
      });
      return;
    }

    if (['', null].contains(lastname)) {
      setState(() {
        requestStatus = 'Please enter last name';
      });
      return;
    }

    setState(() {
      requestStatus = 'Sending . . . ';
    });

    String url = Link.student();
    Map payload = {'firstname': firstname, 'lastname': lastname};

    final response = await Restful.postRequest(url, body: payload);
    submitStudentInfoCallback(response);
  }

  submitStudentInfoCallback(dynamic response) {
    // If status code is 2xx then successful
    if (response.statusCode ~/ 100 == 2) {
      setState(() {
        requestStatus = 'Successful';
      });
      getListStudent();
      return;
    } else {
      setState(() {
        requestStatus = 'Failed';
      });
    }
  }

  getListStudent() async {
    students.clear();
    setState(() {
      students = List.castFrom(students);
    });

    String url = Link.student();
    var response = await Restful.getRequest(url);
    getListStudentCallback(response);
  }

  getListStudentCallback(dynamic response) {
    // If status code is 2xx then successful
    if (response.statusCode ~/ 100 == 2) {
      for (var j in json.decode(response.body)) {
        students.add(Student.fromJSON(j));
      }
      setState(() {
        students = List.castFrom(students);
      });
      return;
    }
  }
}
