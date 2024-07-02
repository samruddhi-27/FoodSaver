import 'package:flutter/material.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';

void main() {
  runApp(
    const MaterialApp(home: IntroPage()),
  );
}

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: spur,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 5),
            Text(
              "FOODSAVER",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              "Join the Food Saving Revolution!",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 64,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 80, right: 40),
              child:
                  Image.asset('lib/images/famine.png', height: 160, width: 160),
            ),
            const SizedBox(height: 5),
            MyButton(
              text: "Get Started",
              onTap: () {
                //go to login page
                Navigator.pushNamed(context, '/options');
              },
            ),
          ],
        ),
      ),
    );
  }
}
