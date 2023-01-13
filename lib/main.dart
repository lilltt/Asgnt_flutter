// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:uuid/uuid.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'GenreName.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  String Priligon = "test";

  get SingleSelectDialogField => null;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    const uuid = Uuid();

    final genreList = [
      GenreName(id: uuid.v4(), name: "Jazz"),
      GenreName(id: uuid.v4(), name: "Classical"),
      GenreName(id: uuid.v4(), name: "Rock"),
      GenreName(id: uuid.v4(), name: "Techno"),
      GenreName(id: uuid.v4(), name: "Trance"),
      GenreName(id: uuid.v4(), name: "Metal"),
      GenreName(id: uuid.v4(), name: "Folk"),
      GenreName(id: uuid.v4(), name: "Pop"),
      GenreName(id: uuid.v4(), name: "Hip Hop"),
      GenreName(id: uuid.v4(), name: "Bass"),
      GenreName(id: uuid.v4(), name: "Soul Music"),
      GenreName(id: uuid.v4(), name: "Country Music"),
      GenreName(id: uuid.v4(), name: "Blues"),
      GenreName(id: uuid.v4(), name: "Electronic"),
      GenreName(id: uuid.v4(), name: "Punk Rock"),
      GenreName(id: uuid.v4(), name: "Disco"),
      GenreName(id: uuid.v4(), name: "Pop Rock"),
      GenreName(id: uuid.v4(), name: "Indie Rock"),
      GenreName(id: uuid.v4(), name: "Orchestra"),
      GenreName(id: uuid.v4(), name: "Ambient Music"),
      GenreName(id: uuid.v4(), name: "World Music"),
      GenreName(id: uuid.v4(), name: "Opera"),
      GenreName(id: uuid.v4(), name: "Contemporary"),
    ];

    List<GenreName?> selectedGenre = [];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xffdde8e8),
        elevation: 0,
      ),
      backgroundColor: Color(0xffdde8e8),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 50),
        child: Form(
          key: formKey, //key for form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Text(
                "Lets Create Your",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              Text(
                "Account !",
                style: TextStyle(fontSize: 30, color: Color(0xffff9c05)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Your name",
                  hintText: "Enter Full Name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xeff7f8f6))),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                    return "Enter correct name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Your Phone Number",
                  hintText: "[+91]....",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xeff7f8f6))),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                          .hasMatch(value!)) {
                    return "Enter correct Number";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Your Email",
                  hintText: "ending with @xyz.com",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xeff7f8f6))),
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value!)) {
                    return "Enter correct email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 130.0,
                    child: SingleChildScrollView(
                      child: MultiSelectDialogField<GenreName?>(
                        title: const Text("Genre"),
                        buttonText: const Text("Select your taste.."),
                        buttonIcon: const Icon(Icons.expand_more),
                        searchable: true,
                        selectedColor: Colors.teal,
                        checkColor: Color(0xff009688),
                        items: genreList
                            .map((item) =>
                                MultiSelectItem<GenreName?>(item, name))
                            .toList(),
                        listType: MultiSelectListType.LIST,
                        onConfirm: (values) {
                          selectedGenre = values;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sign Up",
                      style: TextStyle(fontSize: 25, color: Color(0xffff9c05))),
                  NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final snackBar = SnackBar(
                            content: Text(
                                'Creating Your Account With Your Prefered Music Type..'));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      //boxShape: NeumorphicBoxShape.circle(),
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      depth: 8,
                      //  color: Colors.grey
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
