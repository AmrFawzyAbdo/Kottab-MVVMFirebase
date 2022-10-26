import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentData extends StatelessWidget {
  const StudentData({
    required this.students,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final DocumentSnapshot<Object?> students;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.only(top: 8),
      margin: const EdgeInsets.symmetric(horizontal: 13),
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 13),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.blue, width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getStudentName(),
              getStudentAge(),
              getStudentGender(),
              getStudentPhNumber(),
              getStudentTime(),
              getStudentTecherNa()
            ],
          ),
        ),
      ),
    );
  }

  textStyle() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black54);
  }

  Widget getStudentName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Student name:',
              maxLines: 1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 22.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Text(students['name'], maxLines: 1, style: textStyle()),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }

  Widget getStudentAge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Age:',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 3,
        ),
        Text(students['age'], maxLines: 1, style: textStyle()),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }

  Widget getStudentGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender:',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 3,
        ),
        Text(students['gender'], maxLines: 1, style: textStyle()),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }

  Widget getStudentPhNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone number:',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 3,
        ),
        Text(students['phone'], maxLines: 1, style: textStyle()),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }

  Widget getStudentTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Time:',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 3,
        ),
        Text(students['time'], maxLines: 1, style: textStyle()),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }

  Widget getStudentTecherNa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Teacher name:',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 3,
        ),
        Text(students['teacherName'], maxLines: 1, style: textStyle()),
      ],
    );
  }
}
