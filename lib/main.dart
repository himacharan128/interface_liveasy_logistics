import 'package:app1/screen1.dart';
import 'package:app1/screen2.dart';
import 'package:app1/screen3.dart';
import 'package:app1/screen4.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'frame',
    routes: {
      'frame':(context)=>language(),
      'phone':(context)=> phoneno(),
      'otp':(context)=> otp(),
      'profile':(context)=> profile() ,

    },
  ));
}
