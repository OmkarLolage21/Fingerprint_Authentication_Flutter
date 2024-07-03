import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csi_assignment8/fingerprint.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class HomePage extends StatelessWidget {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('home'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CSI Assignment 8',
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 48),
                buildLogoutButton(context),
                SizedBox(height: 48),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.orange,
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                TextFormField(
                                  controller: namecontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                  ),
                                ),
                                SizedBox(height: 40),
                                TextFormField(
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                  ),
                                ),
                                SizedBox(height: 40),
                                TextFormField(
                                  controller: mobilecontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile number',
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      CollectionReference collRef =
                                          FirebaseFirestore.instance
                                              .collection('Test');
                                      collRef.add({
                                        'name': namecontroller,
                                        'email': emailcontroller,
                                        'mobile': mobilecontroller
                                      });
                                    },
                                    child: Text('Submit'))
                              ],
                            );
                          });
                    },
                    child: Text('Register Form')),
              ],
            ),
          ),
        ),
      );

  Widget buildLogoutButton(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        child: Text(
          'Logout',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FingerprintPage()),
        ),
      );
}
