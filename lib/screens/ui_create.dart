import 'package:flutter/material.dart';
import '../classes/population.dart';

String azAZ = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";

class UICreate extends StatefulWidget
{
  @override
  _UICreateState createState() => new _UICreateState();
}

class _UICreateState extends State<UICreate>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new Center
      (
        child: new FloatingActionButton
        (
          onPressed: ()
          {
            new Population(50, 1.0, "This is a test ", azAZ);
          },
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}