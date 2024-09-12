import 'package:flutter/material.dart';

/// backgroundColor: Color(0xFF8687E7),

const List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
const List<String> daysOfWeek = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat"
];

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              color: const Color(0XFF363636),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                      Text(
                        months[1],
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 56,
                    child: ListView.builder(
                      itemCount: 28, // TODO    count = month.daysCount
                      itemBuilder: (context, index) {
                        return Container(
                          color: const Color(0XFF272727),
                          margin: EdgeInsets.fromLTRB(4, 0, 4, 4),
                          child: Column(
                            children: [
                              Text(
                                "  ${daysOfWeek[index % 7]}  ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        (index % 7 == 0 || index % 7 - 6 == 0)
                                            ? Colors.red
                                            : Colors.white),
                              ),
                              Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color(0XFF4C4C4C),
              padding: const EdgeInsets.all(10),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                // Todo Continuo from here
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    tabs: [
                      Container(
                        width: 110,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.grey)),
                        child: Text("Today",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      Container(
                        width: 110,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Colors.grey),
                        ),
                        child: Text("Completed",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      )
                    ],
                    indicator: const BoxDecoration(color: Color(0xFF8687E7)),
                    onTap: (value) => print(value),
                  ),
                ),
              ),
            ),
            Container(width: 50, height: 50, color: Colors.green),
            // TabBarView(
            //   children: [
            //     Container(width: 50, height: 50, color: Colors.red),
            //     Container(width: 50, height: 50, color: Colors.green)
            //   ],
            // )
          ],
        ));
  }
}
