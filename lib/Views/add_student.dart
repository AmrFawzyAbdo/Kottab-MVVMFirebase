import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kottab/Views/home_view.dart';

import '../view_models/add_student_view_model.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  var addStudentData = AddStudentViewModel();

  // List<String> genederTypee = addStudentData.studentModel.genederType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Add student"),
          ),
          body: Form(
            key: addStudentData.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    studentName(),
                    const SizedBox(height: 20),
                    age(),
                    const SizedBox(height: 20),
                    phone(),
                    const SizedBox(height: 20),
                    time(),
                    const SizedBox(height: 20),
                    teacher(),
                    const SizedBox(height: 20),
                    gender(),
                    const SizedBox(
                      height: 30,
                    ),
                    addStudentBtn()
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget studentName() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && value.length > 2) {
          return null;
        } else if (value.length < 3 && value.isNotEmpty) {
          return "Name is too short";
        } else {
          return "Student name can't be empty";
        }
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Student name',
      ),
      controller: addStudentData.studentNameController,
    );
  }

  Widget age() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Age can't be empty";
        }
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Age',
      ),
      controller: addStudentData.ageController,
    );
  }

  Widget phone() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && value.length > 11) {
          return "Phone number is only 11 digits starts with 01";
        } else if (value.length < 11 && value.isNotEmpty) {
          return "Phone number is too short";
        } else if (value.length == 11 && value.isNotEmpty) {
          return null;
        } else {
          return "Phone number can't be empty";
        }
      },
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Phone number',
      ),
      controller: addStudentData.phoneController,
    );
  }

  Widget time() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Time can't be empty";
        }
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Time',
      ),
      controller: addStudentData.timeController,
    );
  }

  Widget teacher() {
    return TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && value.length > 2) {
          return null;
        } else if (value.length < 3 && value.isNotEmpty) {
          return "Teacher name is too short";
        } else {
          return "Teacher name can't be empty";
        }
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Teacher',
      ),
      controller: addStudentData.teacherController,
    );
  }

  Widget gender() {
    return SizedBox(
      height: 65,
      width: MediaQuery.of(context).size.width,
      // color: Colors.cyan,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  'Select gender',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: addStudentData.genederType
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: addStudentData.selectedValue,
          onChanged: (value) {
            setState(() {
              addStudentData.selectedValue = value as String;
              print(addStudentData.selectedValue);
            });
          },
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 25,
          iconEnabledColor: const Color.fromRGBO(53, 131, 139, 1),
          iconDisabledColor: Colors.grey,
          buttonHeight: 40,
          buttonWidth: 149,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 3)
            ],
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: null,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(0, 0),
        ),
      ),
    );
  }

  Widget addStudentBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.all(10)),
      onPressed: () {
        print("Selected value : ${addStudentData.selectedValue}");
        if (!addStudentData.formKey.currentState!.validate() ||
            addStudentData.selectedValue == null) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          return;
        } else {
          FirebaseFirestore.instance.collection('students2').add({
            'name': addStudentData.studentNameController.text,
            'age': addStudentData.ageController.text,
            'phone': addStudentData.phoneController.text,
            'gender': "${addStudentData.selectedValue}",
            'teacherName': addStudentData.teacherController.text,
            'time': addStudentData.timeController.text,
          });
          Navigator.pop(context, Home());
        }
      },
      child: const Text('Add student'),
    );
  }
}

const snackBar = SnackBar(
  content: Text(
    'Add all required fields!',
    textAlign: TextAlign.center,
  ),
);
