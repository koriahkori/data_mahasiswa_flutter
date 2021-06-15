import 'package:flutter/material.dart';
import 'package:data_mahasiswa/v_mahasiswa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Mahasiswa(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Mahasiswa(),
      },
    );
  }
}
