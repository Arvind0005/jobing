import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobing/database.dart';
import 'package:jobing/selectedbidderdetails.dart';
// import 'package:jobing/selectedbidderdetails.dart';
import 'package:jobing/stylingtextfield.dart';
// import 'package:jobing/viewprofile.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

import 'loading.dart';

class Selectbidder extends StatefulWidget {
  // final String title;
  // final String description;
  // final String imageurl;
  // final int price;
  // final bool biddable;
  // final String profession;
  // final String jobuuid;
  // final String cityname;
  // final String districtname;
  // final String statename;
  Selectbidder({
    Key key,
    // this.title,
    // this.description,
    // this.imageurl,
    // this.price,
    // this.biddable,
    // this.profession,
    // this.jobuuid,
    // this.cityname,
    // this.districtname,
    // this.statename
  }) : super(key: key);
  @override
  _SelectbidderState createState() => _SelectbidderState();
}

class _SelectbidderState extends State<Selectbidder> {
  int bidderprice;
  String selectedtempbid;
  int starrating = 1;
  int bidderpriceinputvalue = null;
  final uuid = Uuid();
  bool loading = false;
  bool isonbid;
  TextEditingController bidderpricecontroller = TextEditingController();
  TextEditingController bidderdescriptioncontroller = TextEditingController();
  String bidderdescription = "";
  String review = "";
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("$height \n $width");

    FirebaseAuth auth = FirebaseAuth.instance;
    String biddingid;
    List samplelist = List(3);
    samplelist = [1, 2, 3];

    return loading == true
        ? Spinkit()
        : Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              elevation: 100,
              backgroundColor: Color(0xff64485C),
              title: Text(
                "jobs data",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Form(
              key: formkey,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 864, top: height / 40.8),
                    child: Text(
                      "Project Description",
                      style: TextStyle(
                          color: Color(0xff64485C),
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  SizedBox(
                    height: height / 40.8,
                  ),
                  Center(
                    child: Text(
                      "Carpenting",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height / 27.2,
                    ),
                    child: Container(
                      child: Image.asset('assets/profilepicture.png',
                          height: height / 2.72, width: width / 1.44),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width / 21.6,
                        top: height / 27.2,
                        right: width / 21.6),
                    child: Text(
                      "description of the project",
                      style: TextStyle(fontSize: width / 25.41, wordSpacing: 2),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 86.4, top: height / 40.8),
                        child: Container(
                          width: width / 4.32,
                          child: Text(
                            "City/Town:",
                            style: TextStyle(
                                color: Color(0xff64485C),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 21.6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 86.4, top: height / 40.8),
                        child: Text(
                          ":",
                          style: TextStyle(
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold,
                              fontSize: width / 21.6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 40.8, left: width / 43.2),
                        child: Container(
                          //  color: Colors.red,
                          width: width / 1.5,
                          child: Text(
                            "Coimbatore",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            ///Todo location comes here.
                            style: TextStyle(
                                color: Colors.green[300],
                                fontSize: width / 21.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 86.4, top: height / 40.8),
                        child: Container(
                          width: width / 4.32,
                          child: Text(
                            "District:",
                            style: TextStyle(
                                color: Color(0xff64485C),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 21.6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 86.4, top: height / 40.8),
                        child: Text(
                          ":",
                          style: TextStyle(
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold,
                              fontSize: width / 21.6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 40.8, left: width / 43.2),
                        child: Container(
                          width: width / 1.5,
                          child: Text(
                            "cbe",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            ///Todo location comes here.
                            style: TextStyle(
                                color: Colors.green[300],
                                fontSize: width / 21.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 86.4, top: height / 40.8),
                        child: Container(
                          //color: Colors.red,
                          width: width / 4.32,
                          child: Text(
                            "State:",
                            style: TextStyle(
                                color: Color(0xff64485C),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 21.6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 86.4, top: height / 40.8),
                        child: Text(
                          ":",
                          style: TextStyle(
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold,
                              fontSize: width / 21.6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 40.8, left: width / 43.2),
                        child: Container(
                          width: width / 1.5,
                          child: Text(
                            "Tamilnadu",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            ///Todo location comes here.
                            style: TextStyle(
                                color: Colors.green[300],
                                fontSize: width / 21.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height / 40.8,
                    ),
                    child: Container(
                      width: width / 1.5,
                      child: Center(
                        child: Text(
                          "Biddable price : 1000",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              wordSpacing: 2,
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 102),
                    child: Center(
                        child: Text("Status : ON WORKING",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: width / 27))),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 40.8, bottom: height / 40.8),
                    child: Container(
                      height: height / 1088,
                      color: Color(0xff64485C),
                      width: width,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 102,
                            left: width / 54,
                            bottom: height / 102,
                            right: width / 54),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Previous Bids ",
                            style: TextStyle(
                                color: Color(0xff64485C),
                                fontWeight: FontWeight.bold,
                                fontSize: width / 18.78),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ListView.builder(
                              physics: new NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ButtonTheme(
                                  padding: EdgeInsets.all(0.0),
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Slectedbidderdetails(
                                                // biddingid: biddata.data()["biddingids"][index],
                                                // profilepiclink: bidderdata.data()["profilepicture"].toString(),
                                                // jobuuid: widget.jobuuid,
                                                // description: bidderdata.data()["description"].toString(),
                                                // biddable: widget.biddable,
                                                // price: bidderdata.data()["price"] == null ? widget.price : bidderdata.data()["price"],
                                                // bidderemail: bidderdata.data()["email"],
                                                // profession: widget.profession,
                                                // jobcompleted: jobdetails.data()["isonbid"] == false && jobdetails.data()["isworking"] == false ? true : false,
                                                // title: widget.title,
                                                ),
                                          ));
                                    },

                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: height / 81.6),
                                                child: ClipOval(
                                                    child: Image.asset(
                                                  'assets/profilepicture.png',
                                                  height: height / 9.35,
                                                  fit: BoxFit.fill,
                                                )),
                                              ),
                                            ]),
                                            SizedBox(
                                              width: width / 21.6,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                    width: width / 1.5,
                                                    child: Center(
                                                      child: Text(
                                                        "Arvind S",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff64485C),
                                                        ),
                                                      ),
                                                    )),
                                                Container(
                                                  // color: Colors.red,
                                                  //height: 100,
                                                  width: width / 1.5,
                                                  //color: Colors.red,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: height / 102,
                                                        left: width / 54,
                                                        bottom: height / 102,
                                                        right: width / 54),
                                                    child: Text(
                                                      "Job Description",
                                                      maxLines: 10,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "Bid for 10000",
                                                    style: TextStyle(
                                                      fontSize: width / 30.85,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 0.5,
                                          width: width,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                    // SizedBox(
                                    //     height: height /
                                    //         81.6),
                                    // index ==
                                    //     biddata.data()["biddingids"].length -
                                    //         1
                                    //     ? Container(
                                    //   height:
                                    //   1,
                                    //   color:
                                    //   Color(0xff64485C),
                                    // )
                                    //     : Container(
                                    //     height:
                                    //     0.5,
                                    //     color:
                                    //     Color(0xff64485C))
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),

                  Container(
                    //    color: Colors.red,
                    height: height / 81.6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 102,
                        left: width / 54,
                        bottom: height / 102,
                        right: width / 54),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Selected bid",
                        style: TextStyle(
                            color: Color(0xff64485C),
                            fontWeight: FontWeight.bold,
                            fontSize: width / 18.78),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  ButtonTheme(
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(width / 21.6)),
                      child: FlatButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(
                          //         builder: (context) {
                          //           return Slectedbidderdetails(
                          //             biddingid: selectedtempbid,
                          //             profilepiclink: selectedbid
                          //                 .data()["profilepicture"],
                          //             description: selectedbid
                          //                 .data()["description"],
                          //             biddable: widget.biddable,
                          //             price: widget.price,
                          //             jobuuid: widget.jobuuid,
                          //             bidderemail:
                          //             selectedbidderemail,
                          //             profession: widget.profession,
                          //             jobcompleted: jobcurrentdetails
                          //                 .data()[
                          //             "isonbid"] ==
                          //                 false &&
                          //                 jobcurrentdetails
                          //                     .data()[
                          //                 "isworking"] ==
                          //                     false
                          //                 ? true
                          //                 : false,
                          //             title: widget.title,
                          //           );
                          //         }));
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: height / 81.6,
                                          top: height / 81.6),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/profilepicture.png',
                                          height: height / 9.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: width / 21.6,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width: width / 1.5,
                                        child: Center(
                                          child: Text(
                                            "RAJ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(
                                                  0xff64485C,
                                                ),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    Container(
                                      //height: 100,
                                      width: width / 1.5,
                                      //color: Colors.red,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 102,
                                            left: width / 54,
                                            bottom: height / 102,
                                            right: width / 54),
                                        child: Text(
                                          "selected bid description",
                                          maxLines: 10,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text("Bid for 10000"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // Container(
                            //   height: 0.5,
                            //   color: Color(0xff64485C),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // }

                  // }
                  // }

                  SizedBox(height: height / 40.8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          child: Text("Job Completed and Rate the jobber",
                              style: TextStyle(color: Colors.white)),
                          color: Color(0xff64485C),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(width / 43.2)),
                          onPressed: () async {
                            // selectedtempbid = null;
                            // setState(() {
                            //   loading = true;
                            // });
                            // await Database()
                            //     .job_completed(
                            //     auth.currentUser
                            //         .email,
                            //     widget.jobuuid);
                            // await Database()
                            //     .createjobs(
                            //   false,
                            //   false,
                            //   jobdata.data()[
                            //   "title"] ==
                            //       null
                            //       ? "Title"
                            //       : jobdata.data()[
                            //   "title"],
                            //   jobdata.data()[
                            //   "Imageurl"],
                            //   "selectedjobsof_${selectedbideremail}",
                            //   jobdata.data()[
                            //   "biddable"],
                            //   jobdata.data()[
                            //   "ProjectDescription"],
                            //   jobdata.data()[
                            //   "profession"],
                            //   null,
                            //   jobdata.data()[
                            //   "Starrating"],
                            //   jobdata.data()[
                            //   "biddingprice"] ==
                            //       null
                            //       ? null
                            //       : jobdata.data()[
                            //   "biddingprice"],
                            //   jobdata.data()[
                            //   "fixedprice"] ==
                            //       null
                            //       ? null
                            //       : jobdata.data()[
                            //   "fixedprice"],
                            //   widget.jobuuid,
                            //   jobdata.data()[
                            //   "cityname"],
                            //   jobdata.data()[
                            //   "districtname"],
                            //   jobdata.data()[
                            //   "statename"],
                            // );
                            // setState(() {
                            //   loading = false;
                            // });
                            // _showMyDialog();
                            // // setState(() {
                            // //   loading = false;
                            // // });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(width: 130),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(width / 43.2)),
                          color: Colors.orangeAccent,
                          onPressed: null,
                          //     : () async {
                          //   setState(() {
                          //     loading = true;
                          //     selectedtempbid = null;
                          //   });
                          //   // await Database()
                          //   //     .reselect_the_bidder(
                          //   //         auth.currentUser
                          //   //             .email,
                          //   //         widget.jobuuid,
                          //   //         widget.profession);
                          //   _reselectjobber(
                          //       jobdata
                          //           .data()["isworking"],
                          //       jobdata.data()["isonbid"],
                          //       auth.currentUser.email);
                          //   setState(() {
                          //     loading = false;
                          //   });
                          // },
                          child: Text(
                            "Re-Select the jobber",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),

                  // Container(
                  //   height: 10,
                  //   color: Colors.red,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(width: 150),
                      FlatButton(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            // await Database().deletedocument(
                            //     auth.currentUser.email, widget.jobuuid);
                            // setState(() {
                            //   loading = false;
                            // });
                            // await Database().removefromjobsid(
                            //     widget.jobuuid, widget.profession);
                            //  await deletejob(auth.currentUser.email);
                            setState(() {
                              loading = false;
                            });
                            Navigator.of(context).pop();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.redAccent,
                          child: Text(
                            "Delete this Job",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  // Future<void> _showMyDialog() async {
  //   int starrating = 1;
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       double width = MediaQuery.of(context).size.width;
  //       double height = MediaQuery.of(context).size.height;
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return Form(
  //             // key: formkey,
  //             child: AlertDialog(
  //               title: Text('Post Your Review'),
  //               content: SingleChildScrollView(
  //                 child: ListBody(
  //                   children: <Widget>[
  //                     Row(
  //                       children: [
  //                         SizedBox(
  //                           height: height / 23.31,
  //                           width: width / 17.28,
  //                           child: IconButton(
  //                             color: Color(0xff64485C),
  //                             iconSize: width / 21.6,
  //                             icon: Icon(Icons.star),
  //                             onPressed: () {
  //                               setState(() {
  //                                 starrating = 1;
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: height / 23.31,
  //                           width: width / 17.28,
  //                           child: IconButton(
  //                             color: Color(0xff64485C),
  //                             iconSize: width / 21.6,
  //                             icon: starrating >= 2
  //                                 ? Icon(Icons.star)
  //                                 : Icon(Icons.star_border),
  //                             onPressed: () {
  //                               setState(() {
  //                                 starrating = 2;
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: height / 23.31,
  //                           width: width / 17.28,
  //                           child: IconButton(
  //                             color: Color(0xff64485C),
  //                             iconSize: width / 21.6,
  //                             icon: starrating >= 3
  //                                 ? Icon(Icons.star)
  //                                 : Icon(Icons.star_border),
  //                             onPressed: () {
  //                               setState(() {
  //                                 starrating = 3;
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: height / 23.31,
  //                           width: width / 17.28,
  //                           child: IconButton(
  //                             color: Color(0xff64485C),
  //                             iconSize: width / 21.6,
  //                             icon: starrating >= 4
  //                                 ? Icon(Icons.star)
  //                                 : Icon(Icons.star_border),
  //                             onPressed: () {
  //                               setState(() {
  //                                 starrating = 4;
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: height / 23.31,
  //                           width: width / 17.28,
  //                           child: IconButton(
  //                             color: Color(0xff64485C),
  //                             iconSize: 20,
  //                             icon: starrating >= 5
  //                                 ? Icon(Icons.star)
  //                                 : Icon(Icons.star_border),
  //                             onPressed: () {
  //                               setState(() {
  //                                 starrating = 5;
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Container(
  //                         child: TextFormField(
  //                           validator: (val) {
  //                             return val.length > 1000
  //                                 ? "Review length is exceeding"
  //                                 : null;
  //                           },
  //                           cursorColor: Color(0xff64485C),
  //                           decoration: InputDecoration(
  //                               helperStyle: 1000 - review.length >= 0
  //                                   ? TextStyle(color: Color(0xff64485C))
  //                                   : TextStyle(color: Colors.red),
  //                               helperText:
  //                               "letters remaining ${1000 - review.length}",
  //                               focusColor: Color(0xff64485C),
  //                               hintText: "Place a review here"),
  //                           onChanged: (val) {
  //                             setState(() {
  //                               review = val.toString();
  //                             });
  //                           },
  //                           controller: bidderdescriptioncontroller,
  //                           keyboardType: TextInputType.multiline,
  //                           maxLines: 100,
  //                           minLines: 1,
  //                           // validator: (val) {
  //                           //   return val.length > 1000 ? null : null;
  //                           // },
  //                         ))
  //                   ],
  //                 ),
  //               ),
  //               actions: <Widget>[
  //                 StreamBuilder(
  //                     stream: FirebaseFirestore.instance
  //                         .collection(widget.profession)
  //                         .doc(widget.jobuuid)
  //                         .snapshots(),
  //                     builder: (context, snapshot) {
  //                       if (snapshot.data == null) {
  //                         return Spinkit();
  //                       }
  //                       DocumentSnapshot jobdetails = snapshot.data;
  //                       return StreamBuilder(
  //                           stream: FirebaseFirestore.instance
  //                               .collection(widget.profession + "biddingids")
  //                               .doc(jobdetails.data()["selected_temp_biduuid"])
  //                               .snapshots(),
  //                           builder: (context, snapshotx) {
  //                             if (snapshotx.data == null) {
  //                               return Spinkit();
  //                             }
  //                             DocumentSnapshot selectedbiddetails =
  //                                 snapshotx.data;
  //                             return StreamBuilder(
  //                                 stream: FirebaseFirestore.instance
  //                                     .collection("userdetails")
  //                                     .doc(selectedbiddetails.data()["email"])
  //                                     .snapshots(),
  //                                 builder: (context, snapshotq) {
  //                                   if (snapshotq.data == null) {
  //                                     return Spinkit();
  //                                   }
  //                                   DocumentSnapshot userdetails =
  //                                       snapshotq.data;
  //                                   int selectedprojects = userdetails
  //                                       .data()["selectedprojects"] ==
  //                                       null
  //                                       ? 0
  //                                       : userdetails
  //                                       .data()["selectedprojects"];
  //                                   int totalstars =
  //                                   userdetails.data()["totalstars"] == null
  //                                       ? 0
  //                                       : userdetails.data()["totalstars"];
  //                                   totalstars = starrating + totalstars;
  //                                   return TextButton(
  //                                     child: Text('Post Review'),
  //                                     onPressed: () async {
  //                                       setState(() {
  //                                         loading = true;
  //                                       });
  //                                       // await Database().job_completed(
  //                                       //     email, widget.jobuuid);
  //                                       await Database().review(
  //                                           selectedbiddetails.data()["email"],
  //                                           widget.jobuuid,
  //                                           starrating,
  //                                           review);
  //                                       await Database()
  //                                           .increase_stars_and_project(
  //                                           totalstars,
  //                                           selectedprojects,
  //                                           selectedbiddetails
  //                                               .data()["email"]);
  //                                       Navigator.of(context).pop();
  //                                       setState(() {
  //                                         loading = false;
  //                                       });
  //                                       // Navigator.of(context).pop();
  //                                     },
  //                                   );
  //                                 });
  //                           });
  //                     }),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // Future<void> _reselectjobber(
  //     bool isworking, bool isonbid, String email) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return Form(
  //             // key: formkey,
  //             child: AlertDialog(
  //               title: Text('Alert'),
  //               content: SingleChildScrollView(
  //                 child: ListBody(
  //                   children: <Widget>[
  //                     Container(
  //                         child: Text(
  //                             "Are you sure you want to reselect the professional?"))
  //                   ],
  //                 ),
  //               ),
  //               actions: <Widget>[
  //                 TextButton(
  //                   child: Text('Yes'),
  //                   onPressed: isworking == false && isonbid == false
  //                       ? null
  //                       : () async {
  //                     setState(() {
  //                       loading = true;
  //                       selectedtempbid = null;
  //                     });
  //                     await Database()
  //                         .addtojobsid(widget.jobuuid, widget.profession);
  //                     await Database().reselect_the_bidder(
  //                         email, widget.jobuuid, widget.profession);
  //                     Navigator.of(context).pop();
  //                     setState(() {
  //                       loading = false;
  //                     });
  //                   },
  //                 ),
  //                 TextButton(
  //                   child: Text('NO'),
  //                   onPressed: () async {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // Future<void> deletejob(String email) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return Form(
  //             // key: formkey,
  //             child: AlertDialog(
  //               title: Text('Alert'),
  //               content: SingleChildScrollView(
  //                 child: ListBody(
  //                   children: <Widget>[
  //                     Container(
  //                         child:
  //                         Text("Are You Sure You Want To Delete This Job?"))
  //                   ],
  //                 ),
  //               ),
  //               actions: <Widget>[
  //                 TextButton(
  //                   child: Text('Yes'),
  //                   onPressed: () async {
  //                     setState(() {
  //                       loading = true;
  //                     });
  //                     await Database().deletedocument(email, widget.jobuuid);
  //                     setState(() {
  //                       loading = false;
  //                     });
  //                     await Database()
  //                         .removefromjobsid(widget.jobuuid, widget.profession);
  //                     setState(() {
  //                       loading = false;
  //                     });
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //                 TextButton(
  //                   child: Text('NO'),
  //                   onPressed: () async {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}
