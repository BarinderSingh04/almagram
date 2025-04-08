import 'package:almagram/screens/verification_page.dart';
import 'package:almagram/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static String get routeName => 'login';

  static String get routeLocation => '/$routeName';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Almagram",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Text("Please enter your mobile number to register or log in to your account"),
              SizedBox(height: 38),
              Material(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(hintText: "Enter Your Mobile Number"),
                ),
              ),
              Spacer(),
              MyElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => VerificationPage()));
                },
                child: Text(
                  "Send OTP",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
