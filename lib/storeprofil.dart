import 'dart:async';
import 'dart:convert' as JSON;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _path = '-';
  bool _pickFileInProgress = false;
  bool _iosPublicDataUTI = true;
  bool _checkByCustomExtension = false;
  bool _checkByMimeType = false;

  Map data;

  Future<String> getData() async {
    var response = await http.get(Uri.encodeFull(
        "https://4t7r04wmqf.execute-api.ap-southeast-2.amazonaws.com/v1/merchant/gladiator_fitness"));

    data = JSON.jsonDecode(response.body);

    print(response.body);

    name.text = data["name"];
    storeUrl.text = data["url"];
    shortDesc.text = data["short_description"];
    longDesc.text = data["long_description"];
  }

  void postData() {
    Map body = new Map<String, dynamic>();
    body["name"] = name.text;
    body["url"] = storeUrl.text;
    body["short_description"] = shortDesc.text;
    body["long_description"] = longDesc.text;

    http
        .post(
            Uri.encodeFull(
                "https://4t7r04wmqf.execute-api.ap-southeast-2.amazonaws.com/v1/merchant/gladiator_fitness"),
            body: body)
        .then((http.Response response) {
      print(response.body);
    });
  }

  final name = TextEditingController();

  final storeUrl = TextEditingController();

  final shortDesc = TextEditingController();

  final longDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Store Profile',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: postData,
                        child: Text(
                          'Upload',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'These details will be used by Payify to market your brand and help drive traffic to your website or send shoppers in store.\n\n'
                      'Please ensure any written content entered in the description fields below is unique and not used elsewhere on the web. We will use this content to improve the discoverability of your brand when users are sharing on Payify and around the web.\n',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: 450, minWidth: 100),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.blue[300], fontSize: 18),
                            textAlign: TextAlign.left,
                            controller: name,
                            decoration: InputDecoration(
                              labelText: "DISPLAY NAME",
                              labelStyle: TextStyle(
                                decorationColor: Colors.blue,
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: 450, minWidth: 250),
                          child: TextField(
                            controller: storeUrl,
                            style: TextStyle(
                                color: Colors.blue[300], fontSize: 18),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: "STORE URL",
                              labelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.blue[300], fontSize: 18),
                    textAlign: TextAlign.left,
                    controller: shortDesc,
                    decoration: InputDecoration(
                      labelText: "SHORT DESCRIPTION",
                      labelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.blue[300], fontSize: 18),
                    textAlign: TextAlign.left,
                    controller: longDesc,
                    decoration: InputDecoration(
                      labelText: "LONG DESCRIPTION",
                      labelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Store Title',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: <Widget>[
                      FlatButton(
                        onPressed: openFilePicker,
                        child: Container(
                          color: Colors.blue[100],
                          width: 250,
                          height: 150,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Upload Your Background Image',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'You must own the rights to use this image. \n'
                            '800*640px min. .png or .jpg/.jpeg',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Wrap(
                    children: <Widget>[
                      Container(
                        color: Colors.blue[100],
                        width: 250,
                        height: 150,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Upload A White Version Of Your Logo',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'For best results, upload a .png file with \n'
                            'transparent background.',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  openFilePicker() async {
    print('Pick file');
    var file = await FilePicker.getFile();
  }
}
