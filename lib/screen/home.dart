import 'dart:io';

import 'package:contect/screen/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Model.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List name = [
    "Kartik Aaryan",
    "Sahrukh khan",
    "Ranvir Singh",
    "Hritic Roshan",
    "Ajay devgan",
    "Siddharth Malhotra",
    "Vijay Devarconda",
    "Vicky Kaushal",
    "Akshay Kumar",
    "Tiger Shroff",
  ];
  List mn = [
    "7435093883",
    "8845235522",
    "1233238873",
    "1233466874",
    "1233466875",
    "1233466876",
    "1233466877",
    "9233466878",
    "1233466878",
    "1233466870"
  ];
  List img = [
    "assets/image/i1.jpg",
    "assets/image/i2.jpg",
    "assets/image/i3.jpg",
    "assets/image/i4.jpg",
    "assets/image/i5.jpg",
    "assets/image/i6.jpg",
    "assets/image/i7.jpg",
    "assets/image/i8.jpg",
    "assets/image/i9.jpg",
    "assets/image/i10.jpg",
  ];
  List em = [
    "kartik@gmail.com",
    "sahrukh@gmail.com",
    "ranvir@gmail.com",
    "hritic@gmail.com",
    "ajay@gmail.com",
    "siddharth@gmail.com",
    "vijay@gmail.com",
    "vickey@gmail.com",
    "akshay@gmail.com",
    "tiger@gmail.com",
  ];

  String cname = "";
  String cnumber = "";
  String cemail = "";

  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  File f1 = (File(""));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Switch(
              value: themedata,
              onChanged: (value) {
                setState(() {
                  themedata = value;
                });
                data.add(themedata);
              },
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
          backgroundColor: Colors.deepOrange,
          title: Text("Contacts"),
          // centerTitle: true,
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3),
                  child: Card(
                    // color: Colors.black87,
                    child: ElevatedButton(
                       // style: ElevatedButton.styleFrom(primary: Colors.black54),
                      onPressed: () {
                        setState(() {
                          Model m1 = Model(
                              name: name[index],
                              mn: mn[index],
                              photo: img[index],
                              email: em[index]);
                          Navigator.pushNamed(context, '/detail',
                              arguments: m1);
                          // l1.add("${name[index]}")
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        height: 60,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: FileImage(File(img[index].toString())),
                              backgroundColor: Colors.white,
                              child: Container(
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${name[index]}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              dialog();
              txtname.clear();
              txtemail.clear();
              txtnumber.clear();
              f1 = File("");
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    ImagePicker ipick = ImagePicker();
                    XFile? f2 =
                        await ipick.pickImage(source: ImageSource.gallery);

                    setState(() {
                      f1 = File(f2!.path);
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: FileImage(f1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txtnumber,
                  decoration: InputDecoration(
                      label: Text("Mobile Number"),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtemail,
                  decoration: InputDecoration(
                      label: Text("Email Address"),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    cname = txtname.text;
                    cnumber = txtnumber.text;
                    cemail = txtemail.text;
                    name.add(cname);
                    mn.add(cnumber);
                    img.add(f1.path);
                    em.add(cemail);
                  });
                },
                child: Text("Save")),
          ],
        );
      },
    );
  }
}
