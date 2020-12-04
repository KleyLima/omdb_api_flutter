import 'package:flutter/material.dart';
import 'search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omdb_api',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Name a Film!"),
          centerTitle: true,
          leading: Icon(Icons.ondemand_video),
        ),
        body: Search(),
      ),
    );
  }
}