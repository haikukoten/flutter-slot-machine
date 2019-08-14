import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
mixin GetUserInfo{
  gettingData() {
    StreamBuilder<QuerySnapshot> build = StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          default:
            return ListView(
                children:
                snapshot.data.documents.map((DocumentSnapshot document) {
                  return ListTile(
                    title: Text(document['email']),

                  );
                }).toList());
        }
      },
    );
    return build;
  }
}