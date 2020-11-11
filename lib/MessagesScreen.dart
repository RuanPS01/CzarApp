import 'package:first_task_flutter/Widgets/CardMessage.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(20),
            child: Text("Your messages",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan))),
        CardMessage(0),
        CardMessage(1),
        CardMessage(2),
        CardMessage(3),
        /*
        ListTile(
          leading: Icon(Icons.queue_music),
          title: Text(QuizData().question[0]['questionText'].toString()),
        ),
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text(QuizData().question[1]['questionText'].toString()),
        ),
        ListTile(
          leading: Icon(Icons.music_video),
          title: Text(QuizData().question[2]['questionText'].toString()),
        ),
        ListTile(
          leading: Icon(Icons.library_music),
          title: Text(QuizData().question[3]['questionText'].toString()),
        ),
        */
      ],
    ));
  }
}
