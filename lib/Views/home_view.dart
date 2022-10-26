import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kottab/Views/student_data.dart';
import 'package:kottab/view_models/home_view_model.dart';

import 'add_student.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController nameController = TextEditingController();
  var _controller = TextEditingController();

  var homeData = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Students"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddStudent()),
                );
                setState(() {});
              },
            )
          ],
        ),
        body: Center(
            child: Column(children: <Widget>[
          Expanded(
            child: homeData.stream(searchTF))
        ])),
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      onChanged: (val) {
        homeData.name = val;
        homeData.teacherName = val;
        homeData.gender = val;
        homeData.time = val;
        setState(() {});
      },
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        labelText: ("Search students"),
        floatingLabelStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon: Icon(Icons.search, color: Colors.black),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              homeData.name = "";
              homeData.teacherName = "";
              homeData.gender = "";
              homeData.time = "";
            });

            _controller.clear();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
