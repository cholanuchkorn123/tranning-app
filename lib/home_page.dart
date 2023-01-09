import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workoutapp_miniproject/video_info.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //ใช้ดึง data จากไฟล์ jsonในเครื่อง
  List data = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/info.json')
        .then((value) {
      setState(() {
        data = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Training',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey.shade700),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Your program',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Detials',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => Video());
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(80)),
                  gradient: LinearGradient(colors: [
                    Colors.purple.shade200.withOpacity(0.2),
                    Colors.lime.shade100
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: Colors.purple.shade200.withOpacity(0.4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Legs Toning',
                      style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'and Glutes Workouts',
                      style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 17,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '60 min',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(4, 8),
                                    color:
                                        Colors.grey.shade600.withOpacity(0.5),
                                    blurRadius: 15)
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 55,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/card.jpg'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(6, 10),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.5)),
                          BoxShadow(
                              offset: Offset(-1, -5),
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.3))
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          right: 200, bottom: 25, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/figure.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      margin: const EdgeInsets.only(left: 100, top: 40),
                      width: double.maxFinite,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            'You doing great',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'keep it up',
                                    style: TextStyle(
                                        color: Colors.purple.shade300,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'stick to your plan',
                                    style: TextStyle(
                                        color: Colors.purple.shade300,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          )
                        ],
                      ),
                      //decoration: BoxDecoration(color: Colors.red),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        'Area of focus',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: (data.length.toDouble() / 2).toInt(),
                      itemBuilder: ((context, index) {
                        int a = 2 * index; // 0,2
                        int b = 2 * index + 1; // 1,3
                        return Row(
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 160,
                              margin: const EdgeInsets.only(
                                  left: 40, bottom: 20, top: 10),
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(data[a]['img']),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        color: Colors.blue.withOpacity(0.3),
                                        blurRadius: 5),
                                    BoxShadow(
                                        offset: Offset(-5, -5),
                                        color: Colors.blue.withOpacity(0.3),
                                        blurRadius: 5)
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  data[a]['title'],
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              )),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 160,
                              margin: const EdgeInsets.only(
                                  left: 20, bottom: 20, top: 10),
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(data[b]['img']),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        color: Colors.blue.withOpacity(0.3),
                                        blurRadius: 5),
                                    BoxShadow(
                                        offset: Offset(-5, -5),
                                        color: Colors.blue.withOpacity(0.3),
                                        blurRadius: 5)
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  data[b]['title'],
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              )),
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
