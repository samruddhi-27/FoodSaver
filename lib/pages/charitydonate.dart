import 'package:flutter/material.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';
class CharityDonate extends StatefulWidget {
  const CharityDonate({Key? key}) : super(key: key);

  @override
  State<CharityDonate> createState() => _CharityDonateState();
}
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const CharityDonate(), // Your Options widget
      },
    ),
  );
}
class _CharityDonateState extends State<CharityDonate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: spur,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 15),
            child: Text("Which nearby charity would you like to donate to?",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: Colors.white
               ),
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView(
              children:[
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(seep),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 100),
                  ),
                ),
                onPressed: () {
                  showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
                    content: Text("Donation details sent!!"),
                  ),);

                },
                child: Row(
                  children: [
                    Text("Smile Foundation",style: GoogleFonts.dmSerifDisplay(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    ),
                    SizedBox(width: 70,),
                    Image.asset("lib/images/smile.png",
                    height: 50,
                    width: 50,),
                  ],
                )
              ),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(seep),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 100),
                      ),
                    ),
                    onPressed: () {
                      showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
                        content: Text("Donation details sent!!"),
                      ),);

                    },
                    child: Row(
                      children: [
                        Text("Dev Sarvodaya Samiti",style: GoogleFonts.dmSerifDisplay(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        ),
                        SizedBox(width: 30,),
                        Image.asset("lib/images/sarvodaya.jpg",
                          height: 50,
                          width: 50,),
                      ],
                    )
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(seep),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 100),
                      ),
                    ),
                    onPressed: () { showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
                      content: Text("Donation details sent!!"),
                    ),);

                    },
                    child: Row(
                      children: [
                        Text("Bharat Sevashram",style: GoogleFonts.dmSerifDisplay(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        ),
                        SizedBox(width: 60,),
                        Image.asset("lib/images/bharat.jpg",
                          height: 60,
                          width: 60,),
                      ],
                    )
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(seep),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 100),
                      ),
                    ),
                    onPressed: () {
                      showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
                        content: Text("Donation details sent!!"),
                      ),);
                    },
                    child: Row(
                      children: [
                        Text("HelpAge India",style: GoogleFonts.dmSerifDisplay(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        ),
                        SizedBox(width: 110,),
                        Image.asset("lib/images/unnamed.jpg",
                          height: 60,
                          width: 60,),
                      ],
                    )
                ),
                SizedBox(height: 10,),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
