import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Fetch {
  final String url;

  Fetch(this.url);

  Future fetchData() async {
    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

class FactScreen extends StatefulWidget {
  @override
  _FactScreenState createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  Future getData() async {
    Fetch fetchData =
        Fetch("https://catfact.ninja/facts?limit=10&max_length=140");
    return fetchData.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green.shade800,
                ),
                child: Text(
                  "Cat Fact's",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 500.0,
                child: FutureBuilder(
                  future: data,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("Loading..."),
                        ),
                      );
                    } else {
                      return ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      image[index % 10],
                                      height: 100.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0),
                                Container(
                                  child: Expanded(
                                    child: Text(
                                      '${snapshot.data["data"][index]["fact"]}',
                                      style: TextStyle(color: Colors.white),
                                      maxLines: 10,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0),
                              ],
                            ),
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const image = [
  'assets/img/cat1.jpg',
  'assets/img/cat2.jpg',
  'assets/img/cat3.jpg',
  'assets/img/cat4.jpg',
  'assets/img/cat5.jpg',
  'assets/img/cat6.jpg',
  'assets/img/cat7.jpg',
  'assets/img/cat8.jpg',
  'assets/img/cat9.jpg',
  'assets/img/cat10.jpg',
];
