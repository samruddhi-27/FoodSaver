import 'package:flutter/material.dart';
import 'package:foodsaver/pages/charityinfo.dart';
import 'package:foodsaver/pages/login1.dart';
import 'package:foodsaver/pages/received.dart';
import 'package:foodsaver/pages/request.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/intropage.dart';
import 'pages/login2.dart';
import 'pages/options.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:const IntroPage(),
      routes:{
        '/intropage': (context) =>IntroPage(),
        '/options':(context) =>  Options(),
        '/login1':(context) => Login1(),
        '/login2':(context) =>  Login2(),
        '/charityinfo': (context) => CharityInfo(),
        '/received': (context) => Received(),

      },

  );
}
}
