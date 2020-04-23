import 'package:flutter/material.dart';

class MoviListVie extends StatelessWidget {
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avergers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Well Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(movies[index]),
            ),
          );
        },
      ),
    );
  }
}
