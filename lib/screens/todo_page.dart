import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, String>> storyData = [
    {"image": "assets/images/calendar.png", "title": "Calendar"},
    {"image": "assets/images/infographic.png", "title": "Infographic"},
    {"image": "assets/images/announcement.png", "title": "Announcement"},
    {"image": "assets/images/event.png", "title": "Event"},
  ];
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
   DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color:Color(0xffF5F5F5) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              height: 94,
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
                        const SizedBox(height: 20),
                        
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        leftChevronIcon: Icon(Icons.chevron_left),
                        rightChevronIcon: Icon(Icons.chevron_right),
                      ),
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        selectedTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        weekendTextStyle: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Schedule on 13 sept", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 380,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
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
                                    child: Image.asset(image[index], fit: BoxFit.cover,)),
                                ),
                              ),
                            const SizedBox(width: 20),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      title[index],
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
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
              ),
              const SizedBox(height: 10),
          ],),
        ),
      ),
    );
  }
}

