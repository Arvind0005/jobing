import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobing/database.dart';
import 'package:jobing/Findjobs.dart';
import 'package:jobing/homepage.dart';
import 'package:jobing/joberdatas.dart';
import 'package:jobing/loading.dart';
import 'package:jobing/stylingtextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CreateJobs extends StatefulWidget {
  const CreateJobs({Key key}) : super(key: key);

  @override
  _CreateJobsState createState() => _CreateJobsState();
}

class _CreateJobsState extends State<CreateJobs> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  TextEditingController titlecontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int titlelength = 0;
  String projecttitle;
  final uuid = Uuid();
  String cityname = "";
  String districtname = "";
  String statename = "";
  bool loading = false;
  int bidding_price;
  TextEditingController otherjobcontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController districtcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  int fixed_price;
  String project_description;
  String otherjobname;
  File imagefile;
  String slectedjob = "Others";
  int starrating = 3;
  bool bidable = true;
  String error = "please complete your profile before posting a job";
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("$height $width");
    return loading == true
        ? Spinkit()
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              backgroundColor: Color(0xff64485C),
              title: Text(
                "Create jobs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Form(
              key: formkey,
              child: ListView(
                children: [
                  Container(
                    // color: Colors.red,
                    height: height / 6,
                    width: width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 5),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Profession",
                                style: TextStyle(
                                    color: Color(0xff64485C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              )),
                        ),
                        Row(
                          children: [
                            // SizedBox(
                            //   width: width / 54,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height / 102,
                                  bottom: height / 102,
                                  left: width / 54),
                              child: DropdownButton<String>(
                                value: slectedjob,
                                items:
                                    Joberdata().jobs.map((String dropdownitem) {
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
                                onChanged: (var changedvalue) {
                                  otherjobcontroller.clear();
                                  setState(() {
                                    slectedjob = changedvalue.toString();
                                    otherjobname = "";
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: TextFormField(
                                controller: otherjobcontroller,
                                // validator: (othername) {
                                //   // return slectedjob == "Others"
                                //   //     ?  othername.isEmpty ? "please specify the job name" : null:
                                //   //     null;
                                //   return true ? "working" : null ;
                                // },
                                onChanged: (othername) {
                                  setState(() {
                                    otherjobname = othername;
                                  });
                                },
                                //enabled: true,
                                enabled: slectedjob == "Others" ? true : false,
                                decoration: styling.copyWith(
                                    hintText: "If others specify"),
                              ),
                              height: height / 13,
                              width: width / 2.16,
                            ),
                          ],
                        ),
                        Container(
                          height: height / height,
                          color: Color(0xff64485C),
                          width: width,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 45.3, left: 432 / 86.4),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        )),
                  ),
                  FlatButton(
                    onPressed: () async {
                      // ImageCropper imagecropper = ImageCropper();
                      // PickedFile? image = await ImagePicker()
                      //     .getImage(source: ImageSource.gallery);
                      // setState(() {
                      //   imagefile = File(image!.path);
                      // });
                      // File cropped = imagefile;
                      // if (cropped != null) {
                      //   setState(() {
                      //     imagefile = cropped;
                      //   });
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/profilepicture.png',
                        height: height / 3.26,
                        width: width / 1.72,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 102,
                        bottom: height / 102,
                        left: width / 54,
                        right: width / 54),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  SizedBox(width: width / 6.17),
                        Spacer(),
                        Container(
                          width: width / 1.707,
                          child: TextFormField(
                            controller: titlecontroller,
                            validator: (val) {
                              return val.toString().length > 25 ||
                                      val.toString().isEmpty
                                  ? "Title Length should be less than 25 letters"
                                  : null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C), width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: "Job Title",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C), width: 2.0),
                                )),
                            onChanged: (val) async {
                              setState(() {
                                titlelength = val.length;
                                projecttitle = val;
                              });
                              print(titlelength);
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: height / 102,
                              bottom: height / 102,
                              left: width / 54,
                            ),
                            child: Text(
                              (25 - titlelength).toString(),
                              style: TextStyle(
                                color: (25 - titlelength) < 0
                                    ? Colors.red
                                    : Color(0xff64485C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width / 14.4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 102, left: width / 54, right: width / 54),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //  height: 50,
                          width: width - (width / 5.4),
                          child: Center(
                            child: TextFormField(
                              validator: (val) {
                                return val.toString().isEmpty
                                    ? "please describe your project"
                                    : null;
                              },
                              onChanged: (val) {
                                setState(() {
                                  project_description = val.toString();
                                });
                              },
                              decoration: styling.copyWith(
                                  hintText:
                                      "                Describe your project here!!"),
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height / 40.8),
                  Container(
                    height: height / 1088,
                    color: Color(0xff64485C),
                    width: width,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 45.3, left: width / 86.4),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Location",
                          style: TextStyle(
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        )),
                  ),
                  SizedBox(
                    height: height / 40.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: width / 1.707,
                          child: TextFormField(
                            controller: citycontroller,
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? "please enter your city or town name"
                                  : null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C),
                                      width: width / 216),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: "City/Town Name",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C),
                                      width: width / 216),
                                )),
                            onChanged: (val) async {
                              setState(() {
                                cityname = val.toString().toLowerCase();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Text(resp),
                  SizedBox(
                    height: height / 40.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: width / 1.707,
                          child: TextFormField(
                            controller: districtcontroller,
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? "please enter your district name"
                                  : null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C),
                                      width: width / 216),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: "District Name",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C),
                                      width: width / 216),
                                )),
                            onChanged: (val) async {
                              setState(() {
                                districtname = val.toString().toLowerCase();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Text(resp),
                  SizedBox(
                    height: height / 40.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: width / 1.707,
                          child: TextFormField(
                            controller: statecontroller,
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? "please enter the state name"
                                  : null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C),
                                      width: width / 216),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: "State Name",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xff64485C),
                                      width: width / 216),
                                )),
                            onChanged: (val) async {
                              setState(() {
                                statename = val.toString().toLowerCase();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Text(resp),
                  SizedBox(
                    height: height / 40.8,
                  ),
                  Container(
                    height: height / 1088,
                    color: Color(0xff64485C),
                    width: width,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 86.4, top: height / 40.8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Pricing and Other",
                          style: TextStyle(
                              color: Color(0xff64485C),
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: height / 27.2,
                        ),
                        child: ButtonTheme(
                          height: height / 20.4,
                          minWidth: width / 3.6,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: bidable ? Color(0xff64485C) : Colors.grey,
                            onPressed: () {
                              setState(() {
                                bidable = true;
                              });
                            },
                            child: Text(
                              "Biddable",
                              style: TextStyle(
                                  color: bidable ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 14.4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width / 14.4,
                          top: height / 27.2,
                        ),
                        child: ButtonTheme(
                          height: height / 20.4,
                          minWidth: width / 3.6,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: bidable ? Colors.grey : Color(0xff64485C),
                            onPressed: () {
                              setState(() {
                                bidable = false;
                              });
                            },
                            child: Text(
                              "Non-Biddable",
                              style: TextStyle(
                                  color: bidable ? Colors.black : Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 40.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextFormField(
                            controller: pricecontroller,
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? bidable
                                      ? "please enter the bidding price "
                                      : "please enter the fixed price"
                                  : null;
                            },
                            onChanged: (val) {
                              setState(() {
                                bidding_price = int.parse(val);
                                fixed_price = 0;
                              });
                              // : setState(() {
                              //     fixed_price = int.parse(val);
                              //     bidding_price = 0;
                              //   });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // enabled: slectedjob == "Others" ? true : false,
                            decoration: styling.copyWith(
                                hintText: bidable
                                    ? "initiate your biding price here!!"
                                    : "Set your fixed price here!!"),
                          ),
                          width: width / 1.44,
                        ),
                      ],
                    ),
                  ),
                  // rating,
                  Padding(
                    padding: EdgeInsets.only(top: height / 40.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          height: height / 20.4,
                          minWidth: width / 3.6,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("userdetails")
                                  .doc("arvindsuresh2002@gmail.com")
                                  .snapshots(),
                              builder: (context, snapshotz) {
                                if (snapshotz.data == null) {
                                  return Spinkit();
                                }
                                DocumentSnapshot userdetails =
                                    snapshotz.data as DocumentSnapshot;
                                // print(snapshotz.data);
                                String phonenumber = userdetails["phonenumber"];
                                String username = userdetails["name"];
                                return FlatButton(
                                  disabledColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed:
                                      // phonenumber == null || username == null
                                      //     ? null
                                      //     :
                                      //     ()
                                      () async {
                                    print("$cityname,$districtname,$statename");
                                    print(
                                        "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
                                    print(otherjobname);
                                    print(slectedjob);
                                    if (otherjobname == null &&
                                        slectedjob == "Others") {
                                      setState(() {
                                        error =
                                            "please specify the profession name";
                                      });
                                    }
                                    // } else if (otherjobname.length == 0 &&
                                    //     slectedjob == "Others") {
                                    //   setState(() {
                                    //     error =
                                    //         "please specify the profession name";
                                    //   });
                                    else if (formkey.currentState.validate()) {
                                      citycontroller.clear();
                                      districtcontroller.clear();
                                      statecontroller.clear();
                                      descriptioncontroller.clear();
                                      pricecontroller.clear();
                                      setState(() {
                                        loading = true;
                                      });
                                      print(otherjobname);
                                      print(slectedjob);
                                      // user = auth.currentUser!;
                                      print("arvindsuresh2002@gmail.com");
                                      String UUID = uuid.v1();
                                      // await Database()
                                      //     .uploadimage(imagefile, UUID);
                                      // String imageurl = await Database()
                                      //     .downloadimage(UUID);
                                      await Database().createjobs(
                                          true,
                                          false,
                                          projecttitle,
                                          "",
                                          "arvindsuresh20002@gmail.com",
                                          bidable,
                                          project_description,
                                          slectedjob,
                                          otherjobname,
                                          starrating,
                                          bidding_price,
                                          fixed_price,
                                          UUID,
                                          cityname,
                                          districtname,
                                          statename);
                                      print("${UUID}$slectedjob");
                                      await Database()
                                          .adduuidtodb(UUID, slectedjob);
                                      await Database().addjobdetails(
                                          projecttitle,
                                          "",
                                          "arvindsuresh20002@gmail.com",
                                          bidable,
                                          project_description,
                                          slectedjob,
                                          otherjobname,
                                          starrating,
                                          bidding_price,
                                          fixed_price,
                                          UUID,
                                          "arvindsuresh20002@gmail.com",
                                          cityname,
                                          districtname,
                                          statename);
                                      await Database().Addtouserdetals(
                                          UUID, "arvindsuresh2002@gmail.com");
                                      posted();
                                      setState(() {
                                        loading = false;
                                      });
                                      // final snackBar = SnackBar(
                                      //   content: Text('Job Posted'),
                                      // );
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(snackBar);
                                      // pricecontroller.clear();
                                      // titlecontroller.clear();
                                      // setState(() {
                                      //   fixed_price = null;
                                      //   bidding_price = null;
                                      //   imagefile = null;
                                      // });
                                      setState(() {
                                        error = "job posted";
                                      });
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                    // setState(() {
                                    //   loading = false;
                                    // });

                                    // final snackBar = SnackBar(
                                    //   content: Text('Job Posted'),
                                    // );
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(snackBar);
                                    // pricecontroller.clear();
                                    // titlecontroller.clear();
                                    // setState(() {
                                    //   imagefile = null;
                                    // });
                                  },
                                  color: Color(0xff64485C),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Post",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: error == "job posted"
                            ? Text(
                                "Note:   " + error + '.',
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            : error != "please specify the profession name"
                                ? Text(
                                    error + '.',
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(error + '.',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  Future<void> posted() async {
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
                      Container(
                          child: Text("Your job has been successfully posted"))
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
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

mixin object {}
