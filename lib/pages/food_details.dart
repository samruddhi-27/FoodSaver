import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebase_options.dart';
import 'charitydonate.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  TextEditingController pickupDestinationController = TextEditingController();
  TextEditingController foodItemsController = TextEditingController();
  TextEditingController servingsController = TextEditingController();



  DateTime selectedDate = DateTime.now();
  String selectedDateText = '';

  TimeOfDay selectionTime = TimeOfDay.now();
  Future<void> saveDataToFirestore() async {
    final firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('food_details').add({
        'food_items': foodItemsController.text,
        'pickup_destination': pickupDestinationController.text,
        'servings': servingsController.text,
        'date': selectedDate.toLocal().toString(),
      });

    } catch (e) {
     print('Error saving data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: spur,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 55, left: 20),
            child: Text(
              "Food Donation Details",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Pickup Destination",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 15, top: 8, bottom: 15),
              child: TextField(
                controller: pickupDestinationController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'address',
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 11.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Food Items",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 15, top: 8, bottom: 15),
              child: TextField(
                controller: foodItemsController,
                style: TextStyle(color: Colors.white),
                maxLines: null, // Allows multiple lines
                decoration: InputDecoration(
                  hintText: 'List food items',
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 11.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),


          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Choose Date",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text("Choose date"),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;

                      selectedDateText = "${pickedDate.toLocal()}".split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(width: 8),
          Text(
            selectedDateText,
            style: GoogleFonts.dmSerifDisplay(fontSize: 15,
            color: Colors.white),
          ),
          Text(
            " ${selectedDate.toLocal()}".split(' ')[0],

            style: TextStyle(

              fontSize: 20,
              color: Colors.white,
            ),
          ),
            ],
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(thickness: 1,
            color: Colors.black87),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Number of servings",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 15, top: 8, bottom: 15),
              child: TextField(
                controller: servingsController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'enter number',
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 11.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, top: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.black87),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                saveDataToFirestore();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CharityDonate(),
                  ),
                );
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FoodDetails(),
        '/charitydonate': (context) => const CharityDonate(),
      },
    ),
  );
}
