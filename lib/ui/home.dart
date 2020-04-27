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
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Positioned(child: movieImage(movieList[index].images[0])),
              Positioned(
                top: 2.0,
                child: movieCard(movieList[index], context),
              ),
            ],
          );
          /* return Card(
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
          );*/
        },
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 70.0),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0, left: 30.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} /10",
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Released: ${movie.released}",
                          style: mainTextStyle(),
                        ),
                        Text(
                          movie.runtime,
                          style: mainTextStyle(),
                        ),
                        Text(
                          movie.rated,
                          style: mainTextStyle(),
                        ),
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieListViewDetails(
              movieName: movie.title,
              movie: movie,
            ),
          ),
        );
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageUrl ??
                'https://images-na.ssl-images-amazon.com/images/M/MV5BZjZkN2M5ODgtMjQ2OC00ZjAxLWE1MjMtZDE0OTNmNGM0NWEwXkEyXkFqcGdeQXVyNjUxNzgwNTE@._V1_SX1777_CR0,0,1777,999_AL_.jpg'),
            fit: BoxFit.cover),
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
      body: ListView(
        children: <Widget>[MovieDetailsThumbnail(thumbnail: movie.images[0])],
      ),
      /*
      body: Center(
        child: Container(
          child: RaisedButton(
              child: Text("Go Back ${this.movie.director}"),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),*/
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.white)
          ],
        ),
      ],
    );
  }
}
