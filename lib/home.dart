import 'package:contect/Model.dart';
import 'package:flutter/material.dart';

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

  List l1 = [""];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
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
                    color: Colors.black87,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black54),
                      onPressed: () {
                        setState(() {
                          // Model m1 = Model(name: name[index],mn: mn[index],photo:  );
                          Navigator.pushNamed(context, '/detail',
                              arguments: l1);
                          l1.clear();
                          l1.add("${img[index]}");
                          l1.add("${name[index]}");
                          l1.add("${mn[index]}");
                          l1.add("${em[index]}");
                          // l1.add("${name[index]}")
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        height: 60,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("${img[index]}"),
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
      ),
    );
  }
}
