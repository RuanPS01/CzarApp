import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../DataScripts/DataQuiz.dart';
import '../DataScripts/AuxFunctions.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CardInstructor extends StatelessWidget {
  final int position;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  CardInstructor(this.position);

  @override
  Widget build(BuildContext context) {
    videoPlayerController = VideoPlayerController.network(
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');

    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: false,
      allowMuting: true,
      materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.white,
          bufferedColor: Colors.grey,
          playedColor: Colors.cyan),
    );

    final playerWidget = Chewie(
      controller: chewieController,
    );

    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.cyan, Colors.blueAccent],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    List<Map<String, Object>> listAnswers =
        QuizData().question[position]['answers'];
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(children: [
        /*
        Image.network(
          'https://placeimg.com/640/480/any',
          fit: BoxFit.fill,
        ),
        */
        Chewie(controller: chewieController),
        Container(
          padding: EdgeInsets.all(16.0),
          height: 100,
          child: Column(
            children: [
              Row(children: [
                Text(
                  "Name of Lesson",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                )
              ]),
              Row(children: [
                Text(
                  "Eugenio",
                  style: TextStyle(fontSize: 11),
                )
              ]),
              Row(children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                )
              ]),
              Row(children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                )
              ]),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 350,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: 200,
              margin: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(75.0)),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.blueAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(28.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 280.0, minHeight: 52.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Book",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 120,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey,
                child: Text(
                  "Details",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ]),
        )
      ]),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
    /*Card(
      color: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          FittedBox(
            child: Text(
              QuizData().question[position]['questionText'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Text(
            "Pergunta " + (position + 1).toString(),
            style: TextStyle(fontSize: 14),
          ),
          ButtonTheme.bar(
              child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text(listAnswers[0]['text']),
                onPressed: () {
                  AuxFunctions().addScore(position, listAnswers[0]['score']);
                },
              ),
              FlatButton(
                child: Text(listAnswers[1]['text']),
                onPressed: () {
                  AuxFunctions().addScore(position, listAnswers[1]['score']);
                },
              ),
              FlatButton(
                child: Text(listAnswers[2]['text']),
                onPressed: () {
                  AuxFunctions().addScore(position, listAnswers[2]['score']);
                },
              ),
              FlatButton(
                child: Text(listAnswers[3]['text']),
                onPressed: () {
                  AuxFunctions().addScore(position, listAnswers[3]['score']);
                },
              ),
            ],
          ))
        ]),
      ),
    );*/
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
  }
}
