import 'package:flutter/material.dart';
import 'package:ing_lab_app/utils/constant.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List contactList = [
    {
      "initials": "AA",
      "name": "A Sebastian A/L Anthony",
      "email": "sebastian@hyped.com.my"
    },
    {
      "initials": "BG",
      "name": "Balu Govindasamy",
      "email": "balugov@gmail.com"
    },
    {
      "initials": "CK",
      "name": "Chong How Kee",
      "email": "chonghowkee@yahoo.com.my"
    },
    {
      "initials": "RF",
      "name": "Robert A/L Francis",
      "email": "robert@hotmail.com"
    },
    {
      "initials": "TY",
      "name": "Teoh Min Kee",
      "email": "teohminkee@inglab.com.my"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 245, 255, 1),
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 0.0),
                    dense: true,
                    leading:
                        const Icon(Icons.search, color: Colors.grey, size: 30),
                    title: TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field cannot be left blank';
                        }
                        return null;
                      },
                      // onChanged: (val) {
                      //   setState(() {
                      //     _username = val;
                      //   });
                      // },
                    ),
                    trailing: const Icon(Icons.highlight_off,
                        color: Colors.grey, size: 30),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  color: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Contacts",
                          style: styles.heading1,
                        ),
                      ),
                      SizedBox(
                        height: 700,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: contactList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ListTile(
                                      // tileColor: Colors.white,
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    255, 168, 171, 1),
                                            foregroundColor: Colors.white,
                                            child: Text(
                                                contactList[index]["initials"]),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        contactList[index]["name"],
                                        style: styles.heading5,
                                      ),
                                      subtitle: Text(
                                        contactList[index]["email"],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //       padding: EdgeInsets.zero,
              //       shrinkWrap: true,
              //       physics: const BouncingScrollPhysics(),
              //       itemCount: 50,
              //       itemBuilder: (context, index) {
              //         return const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Card(
              //             child: ListTile(
              //               tileColor: Colors.green,
              //               leading: CircleAvatar(
              //                 backgroundColor: Colors.white,
              //                 child: Padding(
              //                   padding: EdgeInsets.all(1.0),
              //                   child: CircleAvatar(
              //                     backgroundColor:
              //                         Color.fromRGBO(255, 168, 171, 1),
              //                     foregroundColor: Colors.white,
              //                     child: Text("AA"),
              //                   ),
              //                 ),
              //               ),
              //               title: Text("Name"),
              //               subtitle: Text("Email"),
              //             ),
              //           ),
              //         );
              //       }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
