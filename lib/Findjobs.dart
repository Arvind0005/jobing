import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:jobing/jobpage.dart';
import 'package:jobing/loading.dart';
import 'package:jobing/nodata.dart';
import 'Jobpage.dart';
import 'joberdatas.dart';
import 'stylingtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Findjobs extends StatefulWidget {
  const Findjobs({Key key}) : super(key: key);

  @override
  _FindjobsState createState() => _FindjobsState();
}

class _FindjobsState extends State<Findjobs> {
  int starrating = 4;
  String othername;
  String creator = "";
  TextEditingController otherjobcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
//  String slectedjob = "Carpenter";
  String duplicatejobslected = "carpenter";
  String otherjobslected = "carpenter";
  String otherjobname;
  String slectedjob = "Carpenter";
  List<String> list = ["1", "2", "3", "4"];
  // ignore: deprecated_member_use
  List<dynamic> uuids = List(10);
  bool loading = false;
  List<String> dropdownitemlist = List(Joberdata().jobs.length);
  // String string =
  //     "hgysxvvxsvtxvygfygyefgytwefdrtfdxrextftrwsefswstyvdwydtsgxcfftwstyfwwdcdtrxsystxgjbcgygefbcdbyefgvgcdtycvcvcctftxsgsxtdtfcdsgctfsft";
  @override
  Widget build(BuildContext context) {
    dropdownitemlist = Joberdata().jobs;
    dropdownitemlist.removeLast();
    duplicatejobslected = slectedjob.toLowerCase();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(height);
    print(width);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("jobsid")
            .doc(otherjobslected)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Spinkit();
          }
          DocumentSnapshot data = snapshot.data;
          if (data.data() == null) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: height / 8.16,
                backgroundColor: Color(0xff64485C),
                title: Text(
                  "find jobs",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(height / 81.6),
                      bottomLeft: Radius.circular(height / 81.6)),
                ),
              ),
              body: ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height / 81),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white70.withOpacity(0.5),
                              spreadRadius: width / 86.4,
                              blurRadius: width / 61.71,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: height / 13,
                        width: width,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height / 102,
                                  bottom: height / 90,
                                  left: width / 54,
                                  right: width / 54),
                              child: DropdownButton<String>(
                                value: slectedjob,
                                //  focusColor: Colors.white,
                                items:
                                    dropdownitemlist.map((String dropdownitem) {
                                  return DropdownMenuItem<String>(
                                    value: dropdownitem,
                                    child: Text(
                                      dropdownitem,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: width / 27),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String changedvalue) {
                                  setState(() {
                                    slectedjob = changedvalue;
                                    duplicatejobslected =
                                        slectedjob.toLowerCase();
                                    otherjobslected = slectedjob.toLowerCase();
                                  });
                                },
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 61.714,
                                  //  width: width / 14.4,
                                ),
                                Center(
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height / 40.8,
                                        ),
                                        SizedBox(
                                          height: height / 40.8,
                                          width: width / 3,
                                          child: TextFormField(
                                            controller: otherjobcontroller,
                                            onChanged: (otherchangedname) {
                                              setState(() {
                                                othername = otherchangedname;
                                              });
                                            },
                                            //enabled: true,
                                            // enabled: slectedjob == "Others"
                                            //     ? true
                                            //     : false,
                                            decoration: styling.copyWith(
                                                hintText: "others specify"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: width / 14.4,
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          otherjobslected =
                                              othername.toLowerCase();
                                          duplicatejobslected =
                                              othername.toLowerCase();
                                        });
                                        // print(duplicatejobslected);
                                      },
                                      icon: Icon(Icons.search),
                                      label: Text("")),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  NoData(),
                ],
              ),
            );
          }
          DocumentSnapshot jobsid = snapshot.data;
          uuids = List(jobsid["id"].length);
          // print(jobsids.data()["id"]);
          uuids = jobsid["id"];
          // print(uuids);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: height / 8.16,
              backgroundColor: Color(0xff64485C),
              title: Text(
                "find jobs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(height / 81.6),
                    bottomLeft: Radius.circular(height / 81.6)),
              ),
            ),
            body: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height / 81),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white70.withOpacity(0.5),
                            spreadRadius: width / 86.4,
                            blurRadius: width / 61.71,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: height / 13,
                      width: width,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height / 102,
                                bottom: height / 90,
                                left: width / 54,
                                right: width / 54),
                            child: DropdownButton<String>(
                              value: slectedjob,
                              //  focusColor: Colors.white,
                              items:
                                  dropdownitemlist.map((String dropdownitem) {
                                return DropdownMenuItem<String>(
                                  value: dropdownitem,
                                  child: Text(
                                    dropdownitem,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: width / 27),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String changedvalue) {
                                setState(() {
                                  slectedjob = changedvalue;
                                  duplicatejobslected =
                                      slectedjob.toLowerCase();
                                  otherjobslected = slectedjob.toLowerCase();
                                });
                              },
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 61.714,
                                //  width: width / 14.4,
                              ),
                              Center(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height / 40.8,
                                      ),
                                      SizedBox(
                                        height: height / 40.8,
                                        width: width / 3,
                                        child: TextFormField(
                                          controller: otherjobcontroller,
                                          onChanged: (otherchangedname) {
                                            setState(() {
                                              othername = otherchangedname;
                                            });
                                          },
                                          //enabled: true,
                                          // enabled: slectedjob == "Others"
                                          //     ? true
                                          //     : false,
                                          decoration: styling.copyWith(
                                            hintText: "If others specify",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                minWidth: width / 14.4,
                                child: FlatButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        otherjobslected =
                                            othername.toLowerCase();
                                        duplicatejobslected =
                                            othername.toLowerCase();
                                      });
                                      // print(duplicatejobslected);
                                    },
                                    icon: Icon(Icons.search),
                                    label: Text("")),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: uuids.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection(otherjobslected)
                            .doc(uuids[index].toString())
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Spinkit();
                          }
                          DocumentSnapshot data = snapshot.data;
                          if (data.data() == null) {
                            return NoData();
                          }
                          DocumentSnapshot currentuuiddocument = snapshot.data;
                          creator = currentuuiddocument["creator"];
                          print(currentuuiddocument.data());
                          return ButtonTheme(
                            padding: EdgeInsets.all(0.0),
                            child: FlatButton(
                              disabledColor: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    height: height / 6.8,
                                    width: width,
                                    //color: Colors.red,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height / 102,
                                              left: width / 54,
                                              bottom: height / 102,
                                              right: width / 54),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height / 32.64,
                                              ),
                                              ClipOval(
                                                child: Image.asset(
                                                  'assets/profilepicture.png',
                                                  height: height / 10.8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //   color: Colors.blue,
                                          width: width / 10.8,
                                        ),
                                        Container(
                                          //  color: Colors.yellow,
                                          width: width / 1.54,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      //    color: Colors.red,
                                                      width: width / 2.16,

                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height /
                                                                      102,
                                                                  left: width /
                                                                      54,
                                                                  bottom:
                                                                      height /
                                                                          102,
                                                                  right: width /
                                                                      54),
                                                          child: Text(
                                                            "${currentuuiddocument["title"].toString() == null ? "title" : currentuuiddocument["title"].toString()}-${currentuuiddocument["profession"].toString()}",
                                                            style: titlestyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        width /
                                                                            25.411),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    //  color: Colors.green,
                                                    width: width / 1.728,
                                                    height: height / 16.32,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        currentuuiddocument[
                                                                "ProjectDescription"]
                                                            .toString(),
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height / 81.6,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: width / 4.32,
                                                    child: currentuuiddocument[
                                                                "biddable"] ==
                                                            true
                                                        ? Text(
                                                            currentuuiddocument[
                                                                    "biddingprice"]
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        : Text(
                                                            currentuuiddocument[
                                                                    "fixedprice"]
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff64485C),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                  ),
                                                  SizedBox(
                                                    width: width / 10.8,
                                                  ),
                                                  Container(
                                                    //  color: Colors.red,
                                                    width: width / 3.08,
                                                    child: Center(
                                                      child: Text(
                                                        currentuuiddocument[
                                                                "cityname"]
                                                            .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,

                                                        ///Todo location comes here.
                                                        style: TextStyle(
                                                            color: Colors
                                                                .green[300],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
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
                                        builder: (context) => Jobpage(
                                              title:
                                                  currentuuiddocument["title"],
                                              description: currentuuiddocument[
                                                  "ProjectDescription"],
                                              imageurl: currentuuiddocument[
                                                      "Imageurl"]
                                                  .toString(),
                                              price:
                                                  currentuuiddocument[
                                                              "biddable"] ==
                                                          true
                                                      ? currentuuiddocument[
                                                          "biddingprice"]
                                                      : currentuuiddocument[
                                                          "fixedprice"],
                                              biddable: currentuuiddocument[
                                                  "biddable"],
                                              profession: currentuuiddocument[
                                                  "profession"],
                                              uuid: uuids[index].toString(),
                                              cityname: currentuuiddocument[
                                                  "cityname"],
                                              districtname: currentuuiddocument[
                                                  "districtname"],
                                              statename: currentuuiddocument[
                                                  "statename"],
                                            )));
                              },
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          );
        });
  }
}

const titlestyle = TextStyle(
  fontWeight: FontWeight.bold,
);
