import 'package:flutter/material.dart';
import 'package:foodsaver/pages/request.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodsaver/components/button.dart';
import 'package:foodsaver/components/colors.dart';
import 'package:foodsaver/firebase_options.dart';
import 'package:foodsaver/pages/food_details.dart';
class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const Login2(),
        '/request': (context) => const Request(),
      },
    ),
  );
}
class _Login2State extends State<Login2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: slight,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 20),
            child: Text(
              "Charity",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(
                  "Login",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white54,
                    ),
                    height: 240,
                    width: 340,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.key_sharp,
                                  size: 35,
                                ),
                                SizedBox(width: 10),
                                // Add some space between the icon and the TextField
                                Flexible(
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'foodsaver_id',
                                      hintStyle:
                                      TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        borderSide: BorderSide(
                                          width: 2,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.password_outlined,
                                  size: 35,
                                ),
                                SizedBox(width: 10),
                                // Add some space between the icon and the TextField
                                Flexible(
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'password',
                                      hintStyle:
                                      TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        borderSide: BorderSide(
                                          width: 2,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 45,
                    ),
                    const Text(
                      "Forgot password",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        loginOrCreateAccount();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Request()),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> loginOrCreateAccount() async {
    final auth = FirebaseAuth.instance;
    try {
      if (auth.currentUser == null) {
        // If no user is signed in, create an account
        await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // If a user is already signed in, perform a sign-in
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }
      // Navigate to the FoodDetails page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FoodDetails()),
      );
    } catch (e) {
      // Handle authentication errors here
      print("Authentication failed: $e");
    }
  }
}
