import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/models/preferences.dart';

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
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text('Logged in'),
          trailing: Switch(
            value: Preferences.loggedIn,
            onChanged: (value) {
              setState(() {
                Preferences.setLoggedIn(context, value);
              });
            },
          ),
        )
      ]),
    );
  }
}
