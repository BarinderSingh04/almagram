import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<String> title = [
    "Annual Fest",
    "Tech fest",
    "Blood Donation Mela",
    "Talent Hunt",
    "Social Trader",
    "Farewell",
    "Fresher",
    "Award Show",
  ];
  List image = [
    "assets/images/6397.jpg",
    "assets/images/15871.jpg",
    "assets/images/6397.jpg",
    "assets/images/15871.jpg",
    "assets/images/6397.jpg",
    "assets/images/15871.jpg",
    "assets/images/6397.jpg",
    "assets/images/15871.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Events")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff4378EB),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.filter_alt_outlined, color: Colors.white),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        // borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: title.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(image[index], fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            title[index],
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
