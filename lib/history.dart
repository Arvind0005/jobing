import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobing/selectbidder.dart';
// import 'package:jobing/fauth.dart';
// import 'package:jobing/selectbidder.dart';
import 'jobpage.dart';
import 'loading.dart';
import 'nodata.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isworking;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("$height $width");
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          backgroundColor: Color(0xff64485C),
          title: Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
                child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ButtonTheme(
                  padding: EdgeInsets.all(0.0),
                  child: FlatButton(
                    child: Column(
                      children: [
                        Container(
                          decoration: index % 2 != 0
                              ? BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                )
                              : isworking == true
                                  ? BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orangeAccent
                                              .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    )
                                  : BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.blueGrey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                          height: height / 6.8,
                          width: width,
                          //color: Colors.red,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height / 32.64,
                                    ),
                                    ClipOval(
                                      child: Image.asset(
                                        'assets/profilepicture.png',
                                        height: height / 10.88,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width / 10.8,
                              ),
                              Container(
                                width: width / 1.542,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          child: Text(
                                            index % 2 != 0
                                                ? "Water Tap -Plummbing"
                                                : "Door making -carpenting",
                                            style: titlestyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: height / 16.32,
                                            width: width / 1.728,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                index % 2 != 0
                                                    ? "Water tap repairing"
                                                    : "Two doors making",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 81.6,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width / 4.32,
                                            child: Text(
                                              index % 2 != 0
                                                  ? "10000"
                                                  : "20000",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        SizedBox(
                                          width: width / 10.8,
                                        ),
                                        Container(
                                          //  color: Colors.red,
                                          width: width / 3.085,
                                          child: Center(
                                              child: Text(
                                            index % 2 != 0 ? "cbe" : "erode",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,

                                            ///Todo location comes here.
                                            style: TextStyle(
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height / 1632,
                          color: Color(0xff64485C),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Selectbidder(
                                  // title: currentuuiddocument.data()["title"],
                                  // description: currentuuiddocument
                                  //     .data()["ProjectDescription"],
                                  // imageurl: currentuuiddocument
                                  //     .data()["Imageurl"]
                                  //     .toString(),
                                  // price: currentuuiddocument
                                  //             .data()["biddable"] ==
                                  //         true
                                  //     ? currentuuiddocument
                                  //         .data()["biddingprice"]
                                  //     : currentuuiddocument
                                  //         .data()["fixedprice"],
                                  // biddable:
                                  //     currentuuiddocument.data()["biddable"],
                                  // profession: currentuuiddocument
                                  //     .data()["profession"],
                                  // jobuuid: documentids[index].toString(),
                                  // cityname:
                                  //     currentuuiddocument.data()["cityname"],
                                  // districtname: currentuuiddocument
                                  //     .data()["districtname"],
                                  // statename:
                                  //     currentuuiddocument.data()["statename"],
                                  )));
                    },
                  ),
                );
              },
            )),
          ],
        ));
  }
}

const titlestyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 17);
