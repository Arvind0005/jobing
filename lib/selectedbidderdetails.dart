import 'dart:ffi';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobing/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobing/loading.dart';
//import 'package:jobing/viewprofile.dart';

class Slectedbidderdetails extends StatefulWidget {
  // final String biddingid;
  // final String profilepiclink;
  // final String description;
  // final bool biddable;
  // final int price;
  // final String jobuuid;
  // final String bidderemail;
  // final String profession;
  // bool jobcompleted;
  // final String title;
  Slectedbidderdetails({
    Key key,
    // this.biddingid,
    // this.profilepiclink,
    // this.description,
    // this.biddable,
    // this.price,
    // this.jobuuid,
    // this.bidderemail,
    // this.profession,
    // this.jobcompleted,
    // this.title,
  }) : super(key: key);
  @override
  _SlectedbidderdetailsState createState() => _SlectedbidderdetailsState();
}

class _SlectedbidderdetailsState extends State<Slectedbidderdetails> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  String bidder_num;
  String creator_num;
  String biddercountrycode;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print("yyyyyyyyyyyyyyyyyyyyyyy");
    // print(widget.bidderemail.toString());
    // print(widget.jobcompleted);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(width / 43.2),
              bottomLeft: Radius.circular(width / 43.2)),
        ),
        elevation: 100,
        backgroundColor: Color(0xff64485C),
        title: Text(
          "Bidder Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height / 27.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height / 4.8,
                // width: width / 2.54,
                //color: Colors.red,
                child: ClipOval(
                  child: Image.asset(
                    'assets/profilepicture.png',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 81.6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                  height: height / 20.4,
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 81.6),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width / 36)),
                        color: Color(0xff64485C),
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //       return Viewprofile(
                          //         bidderemail: widget.bidderemail,
                          //       );
                          //     }));
                        },
                        child: Text(
                          "View Profile",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )),
            ],
          ),
          SizedBox(
            height: height / 40.8,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 5.76,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height / 102,
                    right: width / 54,
                    left: width / 54,
                    bottom: height / 102),
                child: Container(
                  height: height / 1088,
                  width: width / 1.728,
                  color: Color(0xff64485C),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 40.8,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height / 102,
                right: width / 54,
                left: width / 54,
                bottom: height / 102),
            child: Text(
              "Description",
              style: TextStyle(
                  color: Color(0xff64485C),
                  fontWeight: FontWeight.bold,
                  fontSize: width / 14.78),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height / 81.6,
                right: width / 43.2,
                left: width / 43.2,
                bottom: height / 81.6),
            child: Center(
                child: Text(
              "Discription of the project",
              style: TextStyle(fontSize: width / 25.8),
            )),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: height / 81.6,
                  right: width / 43.2,
                  left: width / 43.2,
                  bottom: height / 81.6),
              child: Container(
                // color: Colors.red,
                width: width / 1.5,
                child: Center(
                  child: Text(
                    "Bid Price:1000",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: width / 24.8,
                        color: Color(0xff64485C),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          SizedBox(
            height: height / 40.8,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 5.76,
              ),
              Container(
                height: height / 1088,
                width: width / 1.728,
                color: Color(0xff64485C),
              ),
            ],
          ),
          SizedBox(
            height: height / 81.6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                  height: height / 16.32,
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 81.6),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Color(0xff64485C),
                        onPressed: () async {
                          // print(
                          //     "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                          // print(widget.bidderemail);
                          // setState(() {
                          //   loading = true;
                          // });
                          // await Database().SendSMS(
                          //     "Hello iam $username i have selected you as a professional for my job entitled as ${widget.title},this is my contact number you can contact me for more details on the job and job location thank you!",
                          //     [bidder_num]);
                          // await Database().selecttempbiduuid(
                          //     auth.currentUser.email,
                          //     widget.jobuuid,
                          //     widget.biddingid,
                          //     widget.profession);
                          // await Database().isonbidtofalse(
                          //     auth.currentUser.email, widget.jobuuid);
                          // await Database().createjobs(
                          //     false,
                          //     true,
                          //     jobdata.data()["title"] == null
                          //         ? "Title"
                          //         : jobdata.data()["title"],
                          //     jobdata.data()["Imageurl"],
                          //     "selectedjobsof_${widget.bidderemail}",
                          //     jobdata.data()["biddable"],
                          //     jobdata.data()[
                          //         "ProjectDescription"],
                          //     jobdata.data()["profession"],
                          //     null,
                          //     jobdata.data()["Starrating"],
                          //     jobdata.data()[
                          //                 "biddingprice"] ==
                          //             null
                          //         ? null
                          //         : jobdata
                          //             .data()["biddingprice"],
                          //     jobdata.data()["fixedprice"] ==
                          //             null
                          //         ? null
                          //         : jobdata
                          //             .data()["fixedprice"],
                          //     widget.jobuuid);
                          // await Database().removefromjobsid(
                          //  widget.jobuuid, widget.profession);
                          // await Database().addtoselectedprofession(
                          //     widget.bidderemail, widget.profession);
                          // await Database().addselectedjobid(
                          //     widget.profession,
                          //     widget.bidderemail,
                          //     widget.jobuuid);
                          setState(() {
                            loading = false;
                          });
                        },
                        // : null,
                        child: const Text(
                          "Select professional",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )),
            ],
          ),
          SizedBox(
            height: height / 27.2,
          )
        ],
      ),
    );
  }
}
