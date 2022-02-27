import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobing/database.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobing/loading.dart';

class Jobpage extends StatefulWidget {
  final String title;
  final String description;
  final String imageurl;
  final int price;
  final bool biddable;
  final String profession;
  final String uuid;
  final String cityname;
  final String districtname;
  final String statename;
  Jobpage({
    Key key,
    this.title,
    this.description,
    this.imageurl,
    this.price,
    this.biddable,
    this.profession,
    this.uuid,
    this.cityname,
    this.districtname,
    this.statename,
  }) : super(key: key);
  @override
  _JobpageState createState() => _JobpageState();
}

class _JobpageState extends State<Jobpage> {
  int bidderprice;
  int bidderpriceinputvalue = null;
  String username;
  final uuid = Uuid();
  bool loading = false;
  TextEditingController bidderpricecontroller = TextEditingController();
  TextEditingController bidderdescriptioncontroller = TextEditingController();
  String bidderdescription = "";
  String phonenumber = null;
  String error = "please complete your account before posting your bid";
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget.price);
    FirebaseAuth auth = FirebaseAuth.instance;
    //   User user = auth.currentUser;
    String biddingid;
    List samplelist = List(3);
    samplelist = [1, 2, 3];
    print(widget.biddable);
    print("profession");
    print(widget.profession);
    print(widget.uuid);
    return loading == true
        ? Spinkit()
        : Scaffold(
            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              elevation: 100,
              backgroundColor: Color(0xff64485C),
              title: const Text(
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
                        EdgeInsets.only(left: width / 86.4, top: height / 40.8),
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
                      widget.title.toString(),
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
                      child: Image.asset('assets/plumber.jpg',
                          height: height / 2.72, width: width / 1.44),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width / 21.6,
                        top: height / 27.2,
                        right: width / 21.6),
                    child: Text(
                      widget.description,
                      style: TextStyle(fontSize: width / 25.4, wordSpacing: 2),
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
                          width: width / 1.5,
                          child: Text(
                            widget.cityname.toString(),
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
                        padding: const EdgeInsets.only(left: 5.0, top: 20),
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
                            widget.districtname.toString(),
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
                            top: height / 40.8, left: width / 43.2),
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
                            widget.statename.toString(),
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
                    child: Center(
                      child: Text(
                        widget.biddable
                            ? "Biddable price : ${widget.price}"
                            : "Fixed price :${widget.price}",
                        style: TextStyle(
                            fontSize: width / 25.4,
                            wordSpacing: 2,
                            color: widget.biddable
                                ? Color(0xffCD7672)
                                : Color(0xff64485C),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 27.2, bottom: height / 40.8),
                    child: Container(
                      height: 0.75,
                      color: Color(0xff64485C),
                      width: width,
                    ),
                  ),
                  widget.biddable
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height / 102,
                                  left: width / 54,
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
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection(widget.profession)
                                        .doc(widget.uuid)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null) {
                                        return Spinkit();
                                      }

                                      DocumentSnapshot biddata = snapshot.data;
                                      print(
                                          "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                                      //print(biddata[]);
                                      print(
                                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                      return !snapshot.data
                                              .data()
                                              .containsKey('biddingids')
                                          ? Column(
                                              children: [
                                                Container(
                                                  //   color: Colors.red,
                                                  height: height / 8.16,
                                                  width: width,
                                                  child: const Center(
                                                    child: Text(
                                                      "No previous bids!! be first to bid",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: height / 1088,
                                                  color: Color(0xff64485C),
                                                  width: width,
                                                ),
                                              ],
                                            )
                                          : ListView.builder(
                                              physics:
                                                  new NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  biddata["biddingids"].length,
                                              itemBuilder: (context, index) {
                                                return StreamBuilder(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            widget.profession +
                                                                "biddingids")
                                                        .doc(biddata[
                                                                "biddingids"]
                                                            [index])
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshotx) {
                                                      if (snapshotx.data ==
                                                          null) {
                                                        return Spinkit();
                                                      }
                                                      DocumentSnapshot
                                                          bidderdata =
                                                          snapshotx.data;
                                                      return Column(
                                                        children: [
                                                          SizedBox(
                                                              height: height /
                                                                  81.6),
                                                          Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  ClipOval(
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/profilepicture.png',
                                                                      height: height /
                                                                          10.88,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height: height /
                                                                          43.2),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: width /
                                                                    21.6,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    //height: 100,
                                                                    width: width -
                                                                        (width /
                                                                            3.6),
                                                                    //color: Colors.red,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left: width /
                                                                              54,
                                                                          right: width /
                                                                              54,
                                                                          top: height /
                                                                              102,
                                                                          bottom:
                                                                              height / 24),
                                                                      child:
                                                                          Text(
                                                                        bidderdata["description"]
                                                                            .toString(),
                                                                        maxLines:
                                                                            10,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                        "Bid for ${bidderdata["price"]}"),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 0.5,
                                                            color: Color(
                                                                0xff64485C),
                                                          )
                                                        ],
                                                      );
                                                    });
                                              },
                                            );
                                    }),
                              ],
                            )
                          ],
                        )
                      : Container(
                          height: 0.0,
                        ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height / 40.8,
                      ),
                      child: Text(
                        widget.biddable
                            ? "Place Your Bid!"
                            : "Apply for the job!",
                        style: TextStyle(
                            color: Color(0xff64485C),
                            fontWeight: FontWeight.bold,
                            fontSize: width / 18.78),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 16.32,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 8.64,
                      ),
                      widget.biddable == false
                          ? Container()
                          : Container(
                              height: height / 8.16,
                              width: width / 1.44,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    focusColor: Color(0xff64485C),
                                    labelText: "Price",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff64485C), width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width / 43.2)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width / 43.2)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    )),
                                onChanged: (val) {
                                  print(val.toString());
                                  setState(() {
                                    bidderprice = int.parse(val);
                                  });
                                },
                                controller: bidderpricecontroller,
                                validator: (val) {
                                  print(
                                      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                                  print(val);
                                  return val.isEmpty ||
                                          val == null ||
                                          int.parse(val) > widget.price
                                      ? "price should be less than the original price "
                                      : null;
                                },
                              ),
                            ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Container(
                    height: height / 8.16,
                    width: width / 2.16,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: Color(0xff64485C)),
                      child: TextFormField(
                        cursorColor: Color(0xff64485C),
                        decoration: InputDecoration(
                            helperStyle: 1000 - bidderdescription.length >= 0
                                ? TextStyle(color: Color(0xff64485C))
                                : TextStyle(color: Colors.red),
                            helperText:
                                "letters remaining ${1000 - bidderdescription.length}",
                            focusColor: Color(0xff64485C),
                            hintText:
                                "Describe your skills past projects and experience here"),
                        onChanged: (val) {
                          setState(() {
                            bidderdescription = val.toString();
                          });
                        },
                        controller: bidderdescriptioncontroller,
                        keyboardType: TextInputType.multiline,
                        maxLines: 100,
                        minLines: 1,
                        validator: (val) {
                          return val.isEmpty
                              ? "please describe your skills and experience"
                              : null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        minWidth: width / 2.88,
                        height: height / 16.32,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("userdetails")
                                .doc("arvindsuresh2002@gmail.com")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Spinkit();
                              }
                              DocumentSnapshot bidderdetails = snapshot.data;
                              phonenumber = bidderdetails["phonenumber"];
                              username = bidderdetails["name"];
                              // phonenumber == null
                              //     ? error =
                              //         "please complete your account before job seeking"
                              //     : error = "";
                              return FlatButton(
                                disabledColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: phonenumber == null ||
                                        username == null
                                    ? null
                                    : () async {
                                        if (formkey.currentState.validate()) {
                                          if (bidderdescription.length < 1000) {
                                            setState(() {
                                              loading = true;
                                            });
                                            biddingid = uuid.v1();
                                            String bidderprofilepic;
                                            snapshot.data.data().containsKey(
                                                    'profilepicture')
                                                ? bidderprofilepic =
                                                    bidderdetails[
                                                        "profilepicture"]
                                                : bidderprofilepic =
                                                    "https://firebasestorage.googleapis.com/v0/b/jobber-23308.appspot.com/o/profileimage.png?alt=media&token=c1a9b236-d942-40b4-85e5-c0d29bb21c3c";
                                            await Database().addbiddingdetails(
                                                "arvindsuresh2002@gail.com",
                                                widget.profession,
                                                widget.uuid,
                                                bidderprice,
                                                bidderprofilepic,
                                                biddingid);
                                            await Database()
                                                .addtojobsbiddingidlist(
                                              widget.profession,
                                              biddingid,
                                              bidderdescription,
                                              bidderprice,
                                              bidderprofilepic,
                                              !snapshot.data.data().containsKey(
                                                      'profilepicture')
                                                  ? "name"
                                                  : bidderdetails["name"],
                                              "arvindsuresh2002@gmail.com",
                                            );
                                            bidderpricecontroller.clear();
                                            bidderdescriptioncontroller.clear();
                                            setState(() {
                                              bidderdescription = "";
                                              bidderprice = null;
                                              loading = false;
                                            });
                                            bidposted();
                                          }
                                          // final snackBar = SnackBar(
                                          //   content: Text('Profile Updated!'),
                                          // );
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(snackBar);
                                        }
                                      },
                                color: Color(0xff64485C),
                                child: Text(
                                  "Post",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 81.6,
                  ),
                  Text(
                    "Note: " + error,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height / 40.8,
                  ),
                  Container(
                    height: height / 1632,
                    color: Color(0xff64485C),
                  ),
                ],
              ),
            ),
          );
  }

  Future<void> bidposted() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Form(
              // key: formkey,
              child: AlertDialog(
                title: Text('Successful'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Container(child: Text("Bid Posted Successfully"))
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
