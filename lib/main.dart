import 'package:flutter/material.dart';
import 'screens/ui_create.dart';

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new UICreate()
    );
  }
}