import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> storyData = [
    {"image": "assets/images/calendar.png", "title": "Calendar"},
    {"image": "assets/images/infographic.png", "title": "Infographic"},
    {"image": "assets/images/announcement.png", "title": "Announcement"},
    {"image": "assets/images/event.png", "title": "Event"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        automaticallyImplyLeading: false,
        title: Text("Home", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
      ),
      body: SafeArea(
        child: Column(
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
                    padding: const EdgeInsets.only(left: 18, top: 10, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xff7EA4F9), // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(0xffF5F5F5),
                            radius: 40,
                            child: SizedBox(height: 30, child: Image.asset(image)),
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

            // Vertical ListView of content items
            Expanded(
              child: ListView.separated(
                itemCount: 10, // Adjust the number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 23.87, right: 23.87, top: 15, bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  "assets/images/profilePic.png", // Add your profile image path here
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Lorem",
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 9),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris.",
                          ),
                          SizedBox(height: 9),
                          SizedBox(
                            height: 193,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/images/image.png", fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 26,
                                    width: 26,
                                    child: Image.asset("assets/images/like.png"),
                                  ),
                                  SizedBox(width: 11),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset("assets/images/share.png"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 26,
                                width: 26,
                                child: Image.asset("assets/images/whatsapp.png"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [SizedBox(height: 10), Divider(height: 1, color: Colors.grey)],
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
