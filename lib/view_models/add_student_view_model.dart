import 'package:flutter/cupertino.dart';
import 'package:kottab/Model/student_model.dart';

class AddStudentViewModel {
   List<String> genederType = [
    "Male",
    "Female",
  ];

  String? selectedValue;

  final studentNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final timeController = TextEditingController();
  final teacherController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Create a key
}
