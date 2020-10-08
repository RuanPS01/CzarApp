import 'package:flutter/material.dart';
import 'CardInstructor.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class HomeScreen extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search Instructor',
                fillColor: Colors.cyan),
            cursorColor: Colors.cyan,
          ),
        ),
        CardInstructor(0),
        CardInstructor(1),
        CardInstructor(2),
        CardInstructor(3),
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
