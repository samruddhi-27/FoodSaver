import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodsaver/components/colors.dart';


class Received extends StatelessWidget {
  const Received({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Received Details"),
        backgroundColor: spur,
      ),
      body: ReceivedDetailsList(),

    backgroundColor: slight,);
  }
}

class ReceivedDetailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('received').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No received details available."),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var receivedData = snapshot.data!.docs[index].data() as Map<String, dynamic>;

            return ListTile(
              title: Text(receivedData['food_items'] ?? 'N/A'),
              subtitle: Text(receivedData['pickup_destination'] ?? 'N/A'),
              // Add more fields as needed
            );
          },
        );
      },
    );
  }
}
