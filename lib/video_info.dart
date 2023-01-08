import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:workoutapp_miniproject/home_page.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List data = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString('json/video.json').then((value) {
      data = json.decode(value);
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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => Homepage());
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: Colors.grey.shade600,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Legs toning',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'and Glutes workout',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '68 min',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 30,
                            width: 220,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Resistance band , Kateball',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  )
                                ]),
                          )
                        ],
                      )
                    ]),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(80),
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Circuit 1 :Legs Toning',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              '3 sets',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
