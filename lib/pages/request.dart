import 'package:flutter/material.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:foodsaver/components/counter.dart';
import 'package:foodsaver/pages/charityinfo.dart';
import 'package:foodsaver/pages/received.dart';
import 'package:google_fonts/google_fonts.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Request(),
        '/charityinfo': (context) => CharityInfo(),
        '/received': (context) => Received(),



        // Your Options widget
      },
    ),
  );
}

class _RequestState extends State<Request> {
  DateTime selectedDate = DateTime.now();
  String selectedDateText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: spur,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 15),
                child: Text(
                  "Request Details",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 45),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: CircleAvatar(
                      radius: 30, // blue cha radius aahe he
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                "lib/images/oldaunty.jpg",
                                height: 60, // image inside wali
                                width: 60,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/charityinfo');
                                //write on pressed function, i think it goes to donate wala login page 1
                                //routed to login 1
                              },
                            ),
                            ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 5,),
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
            child: const Text("Choose date"),
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

                  selectedDateText = "${pickedDate.toLocal()}"
                      .split(' ')[0]; //this is a bitch i hate this bitch if not working, stop main file and start again plsssss
                });
              }
            },
          ),

          Text(
            selectedDateText,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 16,
              color: Colors.white,
            )
          ),
          Text(
            " ${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                       left: 15, right: 15, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70),
                    height: 90,
                    width: 330,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset("lib/images/lunch.png",
                            height: 50, width: 50),

                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Breakfast",
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 23, color: Colors.black87),
                        ),
                        SizedBox(width: 30,),
                        CounterWidget(

                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 15, right: 15, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70),
                    height: 90,
                    width: 330,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset("lib/images/final.png",
                            height: 50, width: 50),

                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Lunch",
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 23, color: Colors.black87),
                        ),
                        SizedBox(width: 60,),
                        CounterWidget(

                        ),// add that plus minus counter here
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 15, right: 15, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70),
                    height: 90,
                    width: 330,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset("lib/images/what.png",
                            height: 40, width: 40),

                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Dinner",
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 23, color: Colors.black87),
                        ),
                        SizedBox(width: 60,),
                        CounterWidget(

                        ),
                        // add that plus minus counter here
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70),
                    height: 90,
                    width: 330,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset("lib/images/snacks.png",
                            height: 40, width: 40),

                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Snacks",
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 23, color: Colors.black87),
                        ),
                        SizedBox(width: 55),
                        CounterWidget(
                        ),
                        // add that plus minus counter here
                      ],
                    ),
                  ),
                ),
              ],

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(slight),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
                      content: Text("Successfully Submitted"),
                    ),);
                  },
                  child: const Text(
                    "Request Donations",
                    style: TextStyle(
                      fontSize: 17
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(slight),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Received()),
                    );

                  },
                  child: const Text(
                    "Received donations",
                    style: TextStyle(
                        fontSize: 17
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
