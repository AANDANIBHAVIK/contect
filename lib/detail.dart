import 'dart:io';

import 'package:contect/Model.dart';
import 'package:contect/home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    List l1 = ModalRoute.of(context)?.settings.arguments as List;
    // Model m2 = ModalRoute.of(context)!.settings.arguments as Model;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Container(
                      // alignment: Alignment.center,
                      height: 450,
                      width: 500,
                      child: Image.asset("${l1[0]}", fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${l1[1]}",
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
                            String mn = "tel: ${l1[2]}";
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
                            "${l1[2]}",
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
                            "${l1[3]}",
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
                                String sms = "sms: ${l1[2]}";
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
                            "${l1[2]}",
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
                          String data = "";
                          var Share;
                          await Share.share("$data");
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
      ),
    );
  }
}
