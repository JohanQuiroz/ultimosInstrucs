import 'package:aplica04/bloc/provider.dart';
import 'package:aplica04/pages/empleado.dart';
import 'package:aplica04/pages/home.dart';
import 'package:aplica04/pages/login.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'empleado' : (BuildContext context) => EmpleadoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),     
    );
  }
}