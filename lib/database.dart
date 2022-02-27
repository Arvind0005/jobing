import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Future createjobs(
    bool isonbid,
    bool isworking,
    String title,
    String imageurl,
    String email,
    bool biddable,
    String projectdescription,
    String profession,
    String ifothers,
    int starrating,
    int biddingprice,
    int fixedprice,
    String uuid,
    String cityname,
    String districtname,
    String statenaame,
  ) async {
    String price = biddable ? "biddingprice" : "fixedprice";
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection(email).doc(uuid);
    return await documentReference.set({
      "title": title,
      "profession":
          ifothers != null ? ifothers.toLowerCase() : profession.toLowerCase(),
      "ProjectDescription": projectdescription,
      "biddable": biddable,
      "isonbid": isonbid,
      "isworking": isworking,
      price: fixedprice == null ? biddingprice : biddingprice,
      "Starrating": starrating,
      "Imageurl": imageurl,
      "cityname": cityname,
      "districtname": districtname,
      "statename": statenaame,
    });
  }

  Future uploadimage(File image, String uuid) async {
    if (image == null) {
      Future<File> getImageFileFromAssets(String path) async {
        final byteData = await rootBundle.load('assets/$path');
        final file = File('${(await getTemporaryDirectory()).path}/$path');
        await file.writeAsBytes(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
        return file;
      }

      image = await getImageFileFromAssets("Square_image.jpg");
    }
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child("$uuid.jpg");
      await storageReference.putFile(image);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future updateuserdata(
      String imageurl,
      String Bio,
      String phonenumber,
      String username,
      String email,
      String useremail,
      String countrycode) async {
    print("$imageurl , $Bio , $phonenumber,$username,$email,$useremail}");
    var a = await FirebaseFirestore.instance
        .collection("userdetails")
        .doc(useremail)
        .get();
    if (a.exists) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("userdetails").doc(useremail);
      imageurl != null
          ? await documentReference.update({
              "profilepicture": imageurl,
              "phonenumber": phonenumber,
              "name": username,
              "email": email,
              "bio": Bio,
              "countrycode": countrycode,
            })
          : await documentReference.update({
              "phonenumber": phonenumber,
              "name": username,
              "email": email,
              "bio": Bio,
              "countrycode": countrycode,
            });
    } else {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("userdetails").doc(useremail);
      await documentReference.set({
        "profilepicture": imageurl,
        "phonenumber": phonenumber,
        "name": username,
        "email": email,
        "bio": Bio,
        "countrycode": countrycode,
      });
    }
  }

  Future<String> downloadimage(String imageuuid) async {
    Reference storangeReference =
        FirebaseStorage.instance.ref("${imageuuid}.jpg");
    String downloadedurl = await storangeReference.getDownloadURL();
    return downloadedurl;
  }

  Future review(String selectedbidderemail, String jobid, int rating,
      String review) async {
    var a = await FirebaseFirestore.instance
        .collection("selectedjobsof_" + selectedbidderemail)
        .doc(jobid)
        .get();
    if (a.exists) {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("selectedjobsof_" + selectedbidderemail)
          .doc(jobid);
      documentReference.update({
        "Starrating": rating,
        "review": review,
      });
    } else {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("selectedjobsof_" + selectedbidderemail)
          .doc(jobid);
      documentReference.set({
        "Starrating": rating,
        "review": review,
      });
    }
  }

  Future addjobdetails(
      String title,
      String imageurl,
      String email,
      bool biddable,
      String projectdescription,
      String profession,
      String ifothers,
      int starrating,
      int biddingprice,
      int fixedprice,
      String uuid,
      String creatorname,
      String cityname,
      String districtname,
      String statenaame) async {
    String jobname = profession;
    String price = "biddingprice";
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection(jobname.toLowerCase()).doc(uuid);
    return await documentReference.set({
      "title": title,
      "profession": jobname.toLowerCase(),
      "ProjectDescription": projectdescription,
      "biddable": biddable,
      "biddingprice": biddingprice,
      "Starrating": starrating,
      "Imageurl": imageurl,
      "creator": creatorname,
      "cityname": cityname,
      "districtname": districtname,
      "statename": statenaame,
    });
  }

  Future removefromjobsid(String jobid, String profession) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection("jobsid")
        .doc(profession.toLowerCase());
    return await documentReference.update({
      "id": FieldValue.arrayRemove([jobid.toString()]),
    });
  }

  Future addtojobsid(String jobid, String profession) async {
    var a = await FirebaseFirestore.instance
        .collection("jobsid")
        .doc(profession.toLowerCase())
        .get();
    if (a.exists) {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection("jobsid")
          .doc(profession.toLowerCase());
      return await documentReference.update({
        "id": FieldValue.arrayUnion(([jobid.toString()])),
      });
    } else {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection("jobsid")
          .doc(profession.toLowerCase());
      return await documentReference.set({
        "id": FieldValue.arrayUnion(([jobid.toString()])),
      });
    }
  }

  Future addtojobsbiddingidlist(
      String profession,
      String biddingid,
      String Description,
      int price,
      String profilepicture,
      String name,
      String email) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection(profession + "biddingids")
        .doc(biddingid);
    await documentReference.set({
      "description": Description,
      "price": price,
      "name": name,
      "profilepicture": profilepicture,
      "email": email,
    });
  }

  Future isonbidtofalse(String email, String uuid) async {
    var a = await FirebaseFirestore.instance.collection(email).doc(uuid).get();
    if (a.exists) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection(email).doc(uuid);
      await documentReference.update({
        "isonbid": false,
        "isworking": true,
      });
    } else {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection(email).doc(uuid);
      await documentReference.set({
        "isonbid": false,
        "isworking": true,
      });
    }
  }

  Future selecttempbiduuid(String useremail, String jobuuid, String biduuid,
      String profession) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(useremail).doc(jobuuid);
    await documentReference.update({"selected_temp_biduuid": biduuid});
    documentReference =
        FirebaseFirestore.instance.collection(profession).doc(jobuuid);
    return await documentReference.update({"selected_temp_biduuid": biduuid});
  }

  Future addtoselectedprofession(String bidderemail, String profession) async {
    var a = await FirebaseFirestore.instance
        .collection(bidderemail)
        .doc("professions_selected")
        .get();
    if (a.exists) {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection(bidderemail)
          .doc("professions_selected");
      await documentReference.update(({
        "professions_selected": FieldValue.arrayUnion(([profession]))
      }));
    } else {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection(bidderemail)
          .doc("professions_selected");
      await documentReference.set(({
        "professions_selected": FieldValue.arrayUnion(([profession]))
      }));
    }
  }

  Future reselect_the_bidder(
      String email, String jobid, String profession) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(email).doc(jobid);
    await documentReference.update({
      "isworking": false,
      "isonbid": true,
      "selected_temp_biduuid": FieldValue.delete()
    });
    documentReference =
        FirebaseFirestore.instance.collection(profession).doc(jobid);
    await documentReference
        .update({"selected_temp_biduuid": FieldValue.delete()});
  }

  Future job_completed(String email, String jobid) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(email).doc(jobid);
    await documentReference.update({
      "isworking": false,
      "isonbid": false,
    });
  }

  Future addbiddingdetails(String username, String profession, String jobid,
      int price, String profilepictureurl, String bindingid) async {
    var a = await FirebaseFirestore.instance
        .collection(profession)
        .doc(jobid)
        .get();
    if (a.exists) {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection(profession).doc(jobid);
      return await documentReference.update(({
        "biddingids": FieldValue.arrayUnion(([bindingid]))
      }));
    } else {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection(profession).doc(jobid);
      return await documentReference.set(({
        "biddingids": FieldValue.arrayUnion(([bindingid]))
      }));
    }
  }

  Future addselectedjobid(
      String profession, String bidderemail, String jobuuid) async {
    var a = await FirebaseFirestore.instance
        .collection(bidderemail)
        .doc(profession + "_selectedjobids")
        .get();
    if (a.exists) {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection(bidderemail)
          .doc(profession + "_selectedjobids");
      documentReference.update(({
        "selectedjobids": FieldValue.arrayUnion(([jobuuid]))
      }));
    } else {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection(bidderemail)
          .doc(profession + "_selectedjobids");
      documentReference.set(({
        "selectedjobids": FieldValue.arrayUnion(([jobuuid]))
      }));
    }
  }

  Future Addtouserdetals(String uuid, String email) async {
    var a = await FirebaseFirestore.instance
        .collection("userdetails")
        .doc(email)
        .get();
    if (a.exists) {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection("userdetails").doc(email);
      return await documentReference.update({
        "jobscreated": FieldValue.arrayUnion([uuid])
      });
    } else {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection("userdetails").doc(email);
      return await documentReference.set({
        "jobscreated": FieldValue.arrayUnion([uuid])
      });
    }
  }

  Future setemailpassword(String email, String password) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection("userdetails").doc(email);
    return await documentReference.set({
      "email": email,
      "password": password,
      "selectedprojects": 0,
      "totalstars": 0,
    });
  }

  Future adduuidtodb(String uuid, String profession) async {
    var a = await FirebaseFirestore.instance
        .collection("jobsid")
        .doc(profession.toLowerCase())
        .get();
    if (a.exists) {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection("jobsid")
          .doc(profession.toLowerCase());
      return await documentReference.update({
        "id": FieldValue.arrayUnion([uuid])
      });
    } else {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection("jobsid")
          .doc(profession.toLowerCase());
      return await documentReference.set({
        "id": FieldValue.arrayUnion([uuid])
      });
    }
  }

  Future deletedocument(String email, String jobid) async {
    return await FirebaseFirestore.instance
        .collection(email)
        .doc(jobid)
        .delete();
  }

  Future increase_stars_and_project(
      int stars, int completedprojectss, String email) async {
    completedprojectss = completedprojectss + 1;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("userdetails").doc(email);
    return await documentReference.update({
      "selectedprojects": completedprojectss,
      "totalstars": stars,
    });
  }
  //Future updateprofile

  // Future SendSMS(String message, List<String> recipents) async {
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }
}
