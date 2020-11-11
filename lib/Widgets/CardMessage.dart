import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CardMessage extends StatelessWidget {
  final int position;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  CardMessage(this.position);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.cyan, Colors.blueAccent],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 500.0, 70.0));
    ;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(children: [
        /*
        Image.network(
          'https://placeimg.com/640/480/any',
          fit: BoxFit.fill,
        ),
        */
        //Chewie(controller: chewieController),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 60,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.cyan, // button color
                      child: InkWell(
                        splashColor: Colors.white, // inkwell color
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name of person",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
  }
}
