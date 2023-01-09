import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'dart:convert';

import 'package:workoutapp_miniproject/home_page.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List data = [];
  bool _playarea = false;
  late VideoPlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/video.json')
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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Column(
            children: [
              _playarea == false
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      padding:
                          const EdgeInsets.only(top: 50, left: 30, right: 30),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            color:
                                                Colors.black.withOpacity(0.5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            )
                          ]),
                    )
                  : Container(
                      height: 100,
                      padding:
                          const EdgeInsets.only(top: 40, left: 30, right: 30),
                      child: Column(children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                            ),
                          ],
                        ),
                        _playvideocard(context)
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
                  child: Column(
                    children: [
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(child: _listviewcard())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //refactor code
  Widget _playvideocard(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      );
    } else {
      return Text('not show anything');
    }
  }

  _listviewcard() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: ((context, index) {
        return _columncard(index);
      }),
    );
  }

  _ontapvideo(int index) {
    final controller = VideoPlayerController.network(data[index]['videoUrl']);
    _controller = controller;
    setState(() {});
    _controller
      ..initialize().then((_) {
        controller.play();
        setState(() {});
      });
  }

  _columncard(int index) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              _ontapvideo(index);
              setState(() {
                _playarea == false ? _playarea = true : _playarea = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 30),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(data[index]['thumbnail']),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data[index]['title'],
                          style: TextStyle(
                              color: Colors.grey.shade100,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data[index]['time'],
                            style: TextStyle(
                                color: Colors.grey.shade100, fontSize: 13))
                      ],
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Center(
                            child: Text(
                          '15 Rest',
                          style: TextStyle(color: Colors.grey.shade100),
                        )),
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 90; i++)
                            i.isEven
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2)),
                                    width: 2,
                                    height: 1,
                                  )
                                : Container(
                                    width: 3,
                                    height: 1,
                                    color: Colors.grey,
                                  )
                        ],
                      )
                    ],
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 160,
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
