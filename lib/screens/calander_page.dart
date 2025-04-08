import 'package:flutter/material.dart';

class CalanderPage extends StatefulWidget {
  const CalanderPage({super.key});

  @override
  State<CalanderPage> createState() => _CalanderPageState();
}

class _CalanderPageState extends State<CalanderPage> {
  List<Map<String, String>> storyData = [
    {"image": "assets/images/calendar.png", "title": "Calendar"},
    {"image": "assets/images/infographic.png", "title": "Infographic"},
    {"image": "assets/images/announcement.png", "title": "Announcement"},
    {"image": "assets/images/event.png", "title": "Event"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 84,
              decoration: BoxDecoration(color: Color(0xffF5F5F5)),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyData.length,
                itemBuilder: (context, index) {
                  String image = storyData[index]["image"]!;
                  String title = storyData[index]["title"]!;
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      top: 10,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(0xffF5F5F5),
                            radius: 40,
                            child: SizedBox(
                              height: 30,
                              child: Image.asset(image),
                            ),
                          ),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
