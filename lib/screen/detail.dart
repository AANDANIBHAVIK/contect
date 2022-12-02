import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import '../Model.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Model m1 = ModalRoute.of(context)?.settings.arguments as Model;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                // color: Colors.grey,
                child: Stack(
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      height: 450,
                      width: double.infinity,
                      child: Image.file(File(m1.photo.toString()), fit: BoxFit.fill),
                    ),

                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                  ],
                )
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${m1.name}",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          String mn = "tel: ${m1.mn}";
                          launchUrl(Uri.parse(mn));
                        },
                        icon: Icon(
                          Icons.call,
                        )),
                    Icon(Icons.star_border),
                    Icon(Icons.edit),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.contacts,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "${m1.mn}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_email,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "${m1.email}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              String sms = "sms: ${m1.mn}";
                              launchUrl(Uri.parse(sms));
                            },
                            icon: Icon(
                              Icons.textsms,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "${m1.mn}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        String data = "Testing share packges";
                        Share.share("${m1.mn}");
                      },
                      icon: Icon(Icons.share_outlined),
                      label: Text("Share"),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
