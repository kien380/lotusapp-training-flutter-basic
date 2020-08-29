class Student {
  String id;
  int createdAt;
  String firstname;
  String lastname;
  int dob;
  String classId;

  Student();

  Student.fromStudent(Student s) {
    id = s.id;
    createdAt = s.createdAt;
    firstname = s.firstname;
    lastname = s.lastname;
    dob = s.dob;
    classId = s.classId;
  }

  Student.fromName(String firstname, String lastname) {
    this.firstname = firstname;
    this.lastname = lastname;
  }

  Student.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    dob = json['dob'];
    classId = json['classId'];
  }
}
