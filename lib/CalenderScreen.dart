import 'package:flutter/material.dart';

late Function tabViewSetState;
late double screenWidth;
final List todosList = [
  TodoItem(
    title: "1",
  ),
  TodoItem(
    title: "2",
  )
];
DateTime selectedDateTime = DateTime.now(); // Just Initial Value
const List<String> monthsNames = [
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
const List<String> daysOfWeekNames = [
  /// Starts with Monday because it is first day of week for DateTime
  "MON",
  "TUE",
  "WED",
  "THU",
  "FRI",
  "SAT",
  "SUN",
];

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  List get allTodosList => todosList;

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    tabViewSetState = setState;

    screenWidth = MediaQuery.of(context).size.width;
    setState(() {
      todosList;
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calendar"),
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
                          onPressed: () {
                            setState(() {
                              selectedDateTime = selectedDateTime.copyWith(
                                month: selectedDateTime.month - 1,
                              );
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      Column(
                        children: [
                          Text(
                            monthsNames[selectedDateTime.month - 1],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${selectedDateTime.year}",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              selectedDateTime = selectedDateTime.copyWith(
                                month: selectedDateTime.month + 1,
                              );
                            });
                          },
                          icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),
                    height: 66,
                    child: ListView.builder(
                      itemCount: countDaysPerMonth(
                          year: selectedDateTime.year,
                          month: selectedDateTime.month),
                      itemBuilder: (context, index) {
                        // 'Index' start from zero but 'day' start from 1
                        String dayName = daysOfWeekNames[
                            selectedDateTime.copyWith(day: index + 1).weekday -
                                1];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedDateTime =
                                  selectedDateTime.copyWith(day: index + 1);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: (selectedDateTime.day == index + 1)
                                    ? const Color(0XFF8687E7)
                                    : const Color(0XFF272727),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            child: Column(
                              children: [
                                Text(
                                  "  $dayName  ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          (dayName == 'SAT' || dayName == 'SUN')
                                              ? Colors.red
                                              : Colors.white),
                                ),
                                Text("${index + 1}",
                                    style: const TextStyle(fontSize: 18)),
                                Icon(Icons.circle,
                                    size: 4,
                                    color: (Todos()
                                                .getTodos(selectedDateTime
                                                    .copyWith(day: index + 1))
                                                ?.length !=
                                            null)
                                        ? Color(0XFF8687E7)
                                        : Colors.transparent)
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      width: 0.8 * screenWidth,
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      decoration: const BoxDecoration(
                        color: Color(0XFF4C4C4C),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: TabBar(
                        padding: const EdgeInsets.all(10),
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
                            child: const Text("Today",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
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
                            child: const Text("Completed",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          )
                        ],
                        indicator:
                            const BoxDecoration(color: Color(0xFF8687E7)),
                        onTap: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        ListView.builder(
                          itemCount: Todos()
                                  .getTodosByStatus(
                                      dateTime: selectedDateTime,
                                      isChecked: false)
                                  ?.length ??
                              0,
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.1 * screenWidth),
                          itemBuilder: (context, index) {
                            return Todos().getTodosByStatus(
                                dateTime: selectedDateTime,
                                isChecked: false)![index];
                          },
                        ),
                        ListView.builder(
                          itemCount: Todos()
                                  .getTodosByStatus(
                                      dateTime: selectedDateTime,
                                      isChecked: true)
                                  ?.length ??
                              0,
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.1 * screenWidth),
                          itemBuilder: (context, index) {
                            return Todos().getTodosByStatus(
                                dateTime: selectedDateTime,
                                isChecked: true)![index];
                          },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class TodoItem extends StatefulWidget {
  String? title;
  String? desc;
  bool isChecked;
  TimeOfDay timeOfDay = TimeOfDay.now();

  TodoItem({this.title, this.desc, this.isChecked = false});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: const Color(0XFF363636),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        children: [
          Checkbox(
            value: widget.isChecked,
            shape: const CircleBorder(),
            onChanged: (newValue) {
              setState(() {
                widget.isChecked = newValue!;
                // Small delay to show the animation
                Future.delayed(
                  Duration(milliseconds: 150),
                  () {
                    //print("after 300ms");
                    tabViewSetState(() {
                      widget.isChecked = newValue!;
                    });
                  },
                );
              });
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title == null || widget.title!.isEmpty)
                  const SizedBox.shrink()
                else
                  Text("${widget.title}",
                      overflow: TextOverflow.ellipsis, maxLines: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today at ${widget.timeOfDay.format(context)}"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int countDaysPerMonth({required int year, required int month}) {
  return DateTime(year, month + 1).difference(DateTime(year, month)).inDays;
}

String formatDateTime(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}

class Todos {
  static final Map<String, List<TodoItem>> todosMap = {};

  void add({required DateTime dateTime, required TodoItem item}) {
    String key = formatDateTime(dateTime);
    if (todosMap.containsKey(key)) {
      todosMap[key]!.add(item);
    } else {
      todosMap.putIfAbsent(key, () => [item]);
    }
  }

  List<TodoItem>? getTodos(DateTime dateTime) {
    String key = formatDateTime(dateTime);
    return todosMap[key];
  }

  List<TodoItem>? getTodosByStatus(
      {required DateTime dateTime, required bool isChecked}) {
    String key = formatDateTime(dateTime);
    return todosMap[key]
        ?.where((element) => element.isChecked == isChecked)
        .toList();
  }
}
