import 'package:flutter/material.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login1.dart';
import 'login2.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Options(), // Your Options widget
        '/login1': (context) => Login1(), // Define your login screens
        '/login2': (context) => Login2(),
      },
    ),
  );
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: spur,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 100),
              child: Image.asset(
                "lib/images/options.png", //balanced diet image here
                height: 130,
                width: 130,
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: CircleAvatar(
                  radius: 65, // blue cha radius aahe he
                  backgroundColor: Colors.white,
                  child: Container(
                    width: 450,
                    height: 450,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            "lib/images/famine.png", // bhikari hand image
                            height: 40, // image inside wali
                            width: 40,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login1');
                            //write on pressed function, i think it goes to donate wala login page 1
                            //routed to login 1
                          },
                        ),
                        Text(
                          "Donate",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: CircleAvatar(
                  radius: 65, // blue cha radius aahe he
                  backgroundColor: Colors.white,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            "lib/images/deliveryman.png",
                            // take away image hehe
                            height: 300, // image inside wali
                            width: 300,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login2');
                            //write on pressed function, i think it goes to donate wala login page
                            //routed to login2
                          },
                        ),
                        Text(
                          "Charity",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
