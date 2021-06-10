import 'package:flutter/material.dart';
import 'Home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Mundo das Luas',
      initialRoute: "/",
      routes: {

        "/Login"           : (context) => Home()


      },
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      //home: Niver(),
      home: Home(),
     // home: UserInfo()
      // home: GeraFotos("walter","walter@wop.com.br"),
    );
  }
}

