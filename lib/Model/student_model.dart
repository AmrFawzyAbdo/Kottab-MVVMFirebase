class StudentModel {
  String? age;
  String? gender;
  String? name;
  String? phone;
  String? teacherName;
  String? time;

  StudentModel(
      {required this.age,
      required this.gender,
      required this.name,
      required this.phone,
      required this.teacherName,
      required this.time});

  StudentModel.fromFirebase(Map<String, String> studentJson) {
    age = studentJson["age"];
    gender = studentJson["gender"];
    name = studentJson["name"];
    phone = studentJson["phone"];
    teacherName = studentJson["teacherName"];
    time = studentJson["time"];
  }
}
