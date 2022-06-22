import 'package:flutter/material.dart';

class PageSettings extends StatefulWidget {
  PageSettings({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<PageSettings> createState() => _PageSettings();
}

class _PageSettings extends State<PageSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
