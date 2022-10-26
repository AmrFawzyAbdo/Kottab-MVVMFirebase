import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Views/student_data.dart';

class HomeViewModel {
  String fullName = '';
  String name = "";
  String teacherName = "";
  String gender = "";
  String time = "";
  List<String> sName = ["name"];

  late DocumentSnapshot students;

  showAlertDialog(BuildContext context, index) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes!"),
      onPressed: () {
        FirebaseFirestore.instance.collection("students2").get().then(
          (res) {
            // setState(() {
            FirebaseFirestore.instance
                .collection('students2')
                .doc(res.docs[index].id)
                .delete();
            // }
            // );
            Navigator.of(context).pop();
          },
          onError: (e) => print("Error completing: $e"),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("ALert!"),
      content: Text("You want to delete this student?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget stream(Widget Function() searchTF) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students2').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return snapshot.data!.docs.length == 0
              ? Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 13),
                        child: searchTF()),
                    Center(
                      child: Text(
                        'No students.',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 13, left: 13, right: 13),
                        child: Column(
                          children: [
                            searchTF(),
                            SizedBox(
                              height: 13,
                            ),
                            Text(
                              "Students count: ${snapshot.data!.docs.length}",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        )),
                    Expanded(
                        child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        students = snapshot.data!.docs[index];

                        print("COUNTTTT: ${snapshot.data!.docs.length}");

                        if (name.isEmpty &&
                            teacherName.isEmpty &&
                            gender.isEmpty &&
                            time.isEmpty) {
                          return StudentData(
                            students: students,
                            onTap: () {
                              showAlertDialog(context, index);
                              // setState(() {});
                              print("RE");
                            },
                          );
                        }
                        if (students["name"]
                                .toString()
                                .toLowerCase()
                                .startsWith(name.toLowerCase()) ||
                            students["teacherName"]
                                .toString()
                                .toLowerCase()
                                .startsWith(teacherName.toLowerCase()) ||
                            students["gender"]
                                .toString()
                                .toLowerCase()
                                .startsWith(gender.toLowerCase()) ||
                            students["time"]
                                .toString()
                                .toLowerCase()
                                .startsWith(time.toLowerCase())) {
                          return StudentData(
                            students: students,
                            onTap: () {
                              showAlertDialog(context, index);
                              print("RE ${snapshot.data!.docs[index].id}");
                            },
                          );
                        }
                        return Container();
                      },
                    )),
                  ],
                );
        });
  }
}
