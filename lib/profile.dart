import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key key}) : super(key: key);

  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          backgroundColor: Color(0xff64485C),
          title: const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  print("logout");
                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                  // prefs.remove("email");
                  // await Fauth().Logout();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Signup_page();
                  // }));
                })
          ],
        ),
        body: ListView(
          children: [
            Container(
              //   color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                        child: Image.asset(
                      "assets/profilepicture.png",
                      height: height / 6.4,
                      fit: BoxFit.fill,
                    )),
                  ),
                  // SizedBox(
                  //   height: height / 81.6,
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width / 1.8,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Bio of the User"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 102),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () async {
                        print("edit profile");
                        // print("hello");
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return EditProfile();
                        // }));
                      },
                      color: Color(0xff64485C),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 81.6,
                  ),
                  Container(
                    height: height / 1632,
                    color: Color(0xff64485C),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 40.8),
              child: Row(
                children: [
                  Container(
                    //  color: Colors.blue,
                    width: width / 3.6,
                    child: Text(
                      "Name",
                      style: TextStyle(
                          color: Color(0xff64485C),
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        color: Color(0xff64485C),
                        fontWeight: FontWeight.bold,
                        fontSize: width / 18.78),
                  ),
                  SizedBox(
                    width: width / 43.6,
                  ),
                  Container(
                    width: width / 1.5,
                    child: Text(
                      "Arvind",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width / 21.6),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 27.2),
              child: Row(
                children: [
                  Container(
                    //  color: Colors.red,
                    width: width / 3.6,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Color(0xff64485C),
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        color: Color(0xff64485C),
                        fontWeight: FontWeight.bold,
                        fontSize: width / 18.78),
                  ),
                  SizedBox(
                    width: width / 43.6,
                  ),
                  Container(
                    width: width / 1.5,
                    child: Text(
                      "arvindsuresh2002@gmail.com",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width / 21.6),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 27.2),
              child: Row(
                children: [
                  Container(
                    width: width / 3.6,
                    child: Text(
                      "Phone No",
                      style: TextStyle(
                          color: Color(0xff64485C),
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        color: Color(0xff64485C),
                        fontWeight: FontWeight.bold,
                        fontSize: width / 18.78),
                  ),
                  SizedBox(
                    width: width / 43.6,
                  ),
                  Container(
                    width: width / 1.5,
                    child: Text(
                      "+91 9087442642",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width / 21.6),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 27.2),
              child: Row(
                children: [
                  Container(
                    width: width / 3.6,
                    child: Text(
                      "Experience ",
                      style: TextStyle(
                          color: Color(0xff64485C),
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        color: Color(0xff64485C),
                        fontWeight: FontWeight.bold,
                        fontSize: width / 18.78),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: width / 1.5,
                    child: Text(
                      "2 project(s)",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width / 21.6),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 27.2),
              child: Row(
                children: [
                  Container(
                    //  color: Colors.red,
                    width: width / 3.6,
                    child: Text(
                      "Rating",
                      style: TextStyle(
                          color: Color(0xff64485C),
                          fontWeight: FontWeight.bold,
                          fontSize: width / 18.78),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        color: Color(0xff64485C),
                        fontWeight: FontWeight.bold,
                        fontSize: width / 18.78),
                  ),
                  SizedBox(
                    width: width / 43.6,
                  ),
                  Container(
                    width: width / 1.5,
                    child: Row(
                      children: [
                        Text(
                          "5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width / 21.6),
                        ),
                        Icon(Icons.star,
                            color: Colors.orangeAccent, size: width / 21.6)
                      ],
                    ),
                  ),
                  // userdetails.data()["email"] != null
                  //     ? Text(
                  //         userdetails.data()["email"],
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: width / 21.6),
                  //       )
                  //     : Text(
                  //         "Not Speecified",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: width / 21.6),
                  //       ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 27.2),
              child: Text(
                "Projects created",
                style: TextStyle(
                    color: Color(0xff64485C),
                    fontWeight: FontWeight.bold,
                    fontSize: width / 18.78),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: height / 3.18,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //  physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {
                      print("pressed");
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height / 102,
                          bottom: height / 102,
                          left: width / 54,
                          right: width / 54),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(width / 86.4)),
                        height: height / 3.709,
                        width: width / 2.46,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height / 40.8,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: height / 7.418,
                                  width: width / 13.292,
                                  //color: Colors.red,
                                ),
                                Container(
                                  // color: Colors.red,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(width / 86.4),
                                    child: Image.asset(
                                      "assets/plumber.jpg",
                                      height: height / 7.41,
                                      width: width / 3.92,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height / 7.418,
                                  width: width / 13.292,
                                  //color: Colors.red,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height / 54.4),
                              child: Container(
                                width: width / 2.46,
                                child: const Center(
                                  child: Text("plumbing",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 40.8,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width / 144),
                                  child: Container(
                                      child: Container(
                                    width: width / 4.32,
                                    child: const Text(
                                      "1000",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 27.2),
              child: Text(
                "Past Projects",
                style: TextStyle(
                    color: Color(0xff64485C),
                    fontWeight: FontWeight.bold,
                    fontSize: width / 18.78),
              ),
            ),
            Container(
              height: height / 3.813,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return FlatButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: height / 102,
                            bottom: height / 102,
                            left: width / 54,
                            right: width / 54),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.circular(width / 86.4)),
                          height: height / 4.08,
                          width: width / 2.46,
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 40.8,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height / 7.41,
                                    width: width / 13.29,
                                    //color: Colors.red,
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "assets/plumber.jpg",
                                        height: height / 7.41,
                                        width: width / 3.92,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: height / 7.41 - 10,
                                    width: width / 13.29,
                                    //   color: Colors.red,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height / 54.4),
                                child: Container(
                                  width: width / 2.46,
                                  child: const Center(
                                    child: Text("plumbing",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 40.8 - 10,
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: height / 4.08,
            ),
          ],
        ));
  }
}
