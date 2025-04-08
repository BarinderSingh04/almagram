import 'package:almagram/screens/create_profile_page.dart';
import 'package:almagram/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
                  text: "OTP for ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Verification",
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
              Text("Please enter the 4-digit code sent to your registered mobile number."),
              SizedBox(height: 38),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PinCodeTextField(
                  appContext: context,
                  textStyle: const TextStyle(color: Colors.black),
                  pastedTextStyle: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  errorTextSpace: 35,
                  errorTextMargin: const EdgeInsets.only(bottom: 4),
                  animationType: AnimationType.fade,
                  backgroundColor: Colors.white,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    selectedFillColor: const Color(0xFFF4F5F5),
                    selectedColor: const Color(0xFFEBEBEB),
                    activeColor: const Color.fromARGB(255, 228, 228, 228),
                    inactiveColor: Color.fromARGB(255, 228, 228, 228),
                    inactiveFillColor: Color(0xffF5F5F5),
                    activeFillColor: const Color(0xFFF4F5F5),
                    borderWidth: 1,
                    fieldHeight: 64,
                    fieldWidth: 64,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter otp first";
                    } else if (value.length < 4) {
                      return "OTP can't be less than 4 digits";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Spacer(),
              MyElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => CreateProfilePage()));
                },
                child: Text("Verify", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
