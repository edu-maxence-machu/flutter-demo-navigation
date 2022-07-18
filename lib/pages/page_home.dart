import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/pages/page_contact.dart';

class PageHome extends StatefulWidget {
  PageHome({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  void getContacts() {
    contacts = [
      {
        "name": "John",
        "phone": "0123456789",
        "picture": "https://thispersondoesnotexist.com/image?random=1"
      },
      {
        "name": "Jane",
        "phone": "0123456789",
        "picture": "https://thispersondoesnotexist.com/image?random=2"
      },
      {
        "name": "Jack",
        "phone": "0123456789",
        "picture": "https://thispersondoesnotexist.com/image?random=3"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, i) {
              Map<String, dynamic> contact = contacts[i];
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Card(
                    elevation: 2.0,
                    // InkWell car on a besoin d'un onTap pour aller sur une autre vue
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return PageContact(contact: contact);
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _size.width / 2.5,
                              child: Text(
                                contact['name'],
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Text(
                              contact['phone'],
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    )),
              );
            }));
  }
}
