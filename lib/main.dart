import 'package:flutter/material.dart';
import 'package:jobing/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //String email = prefs.getString("email");
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //  .then((_) {
  runApp(const MyApp());
  //print("login:" + login.toString());
  // runApp((MaterialApp(
  //   home: email == null ? Signup_page() : Homepage(),
  // )));
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
