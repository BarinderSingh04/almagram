import 'package:almagram/screens/welcome_page.dart';
import 'package:almagram/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final yearController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    yearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    text: "Personal ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Details",
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
                Text("Please Enter the following details asked."),
                SizedBox(height: 24),
                Material(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(decoration: const InputDecoration(hintText: "Your name")),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Your Email"),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    controller: yearController,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1946),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() {
                          yearController.text = date.year.toString();
                        });
                      }
                    },
                    decoration: const InputDecoration(hintText: "Select Passing year"),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Enter college name"),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(15),
                          onChanged: (value) {},
                          items: [
                            DropdownMenuItem(value: "chd", child: Text("Chandigarh")),
                            DropdownMenuItem(value: "mohali", child: Text("Mohali")),
                          ],
                          decoration: const InputDecoration(hintText: "Select State"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Material(
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(15),
                          onChanged: (value) {},
                          items: [
                            DropdownMenuItem(value: "Punjab", child: Text("Punjab")),
                            DropdownMenuItem(value: "Delhi", child: Text("Delhi")),
                          ],
                          decoration: const InputDecoration(hintText: "Select City"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48),
                MyElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
                  child: Text("Next", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
