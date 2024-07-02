import 'package:flutter/material.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:foodsaver/components/counter.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityInfo extends StatefulWidget {
  const CharityInfo({Key? key}) : super(key: key);

  @override
  State<CharityInfo> createState() => _CharityInfoState();
}

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const CharityInfo(),
      },
    ),
  );
}

class _CharityInfoState extends State<CharityInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: spur,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
              child: Image.asset(
                "lib/images/unnamed.jpg",
                height: 130,
                width: 130,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Help Age India",
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 35, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),

          //container with elderly support
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 27,
            width: 230,
            child: Text(
              "Elderly Support",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //some long ass text
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
            child: Text(
              "HelpAge India is a leading charity in India working with and for disadvantaged elderly for nearly 4 decades. It was set up in 1978 and is registered under the Societies’ Registration Act of 1860.",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //HelpAge India is a leading charity in India working with and for disadvantaged elderly for nearly 4 decades. It was set up in 1978 and is registered under the Societies’ Registration Act of 1860.

          //container that has location + strength
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: seep,
            ),
            height: 250,
            width: 300,
            child: Column(
              children: [
                Row(

                  children: [
                    SizedBox(height: 20,width: 10),
                    Text("Location",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20,
                     ),

                    ),
                    SizedBox(height:10,width: 10,),
                    Icon(Icons.location_on_outlined),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text("No. 34-A, 44, JP Rd, Gharkul Society, Manish Nagar, Andheri West, Mumbai, Maharashtra 400053",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                  ),
                ),
                Divider(thickness: 1,
                color: Colors.black54,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Strength",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                    ),

                    CounterWidget(),
                  ],
                ),

              ],
            ),

          ),
        ],
      ),
    );
  }
}
