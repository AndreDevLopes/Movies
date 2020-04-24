import 'package:flutter/material.dart';
import '../models/movie.dart';

class MoviListVie extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
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
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4.5,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieList[index].images[0]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(13.9),
                    ),
                    child: null),
              ),
              trailing: Text("..."),
              title: Text(movieList[index].title),
              subtitle: Text("${movieList[index].title}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieListViewDetails(
                      movieName: movieList.elementAt(index).title,
                      movie: movieList[index],
                    ),
                  ),
                );
              },
              // onTap: () => debugPrint(movies.elementAt(index)),
            ),
          );
        },
      ),
    );
  }
}

//novas rotas
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies "),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
              child: Text("Go Back ${this.movie.director}"),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
