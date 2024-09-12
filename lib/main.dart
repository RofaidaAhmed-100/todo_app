import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/home/home_screen.dart';
import 'package:to_do/my_theme_data.dart';

void main(){
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseFirestore.instance.disableNetwork();
    runApp(const MyApp());
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=>  const HomeScreen(),
      },
      theme: MyThemeData.lightTheme,

    );
  }
}
