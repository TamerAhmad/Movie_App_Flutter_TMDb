import 'package:flutter/material.dart';
import 'package:timomovieflutter/app_state.dart';
import 'package:timomovieflutter/movie_card.dart';
import 'top_movie_card.dart';

class FavoritePage extends StatefulWidget {
  final AppState appState;

  FavoritePage({@required this.appState}) : assert(appState != null);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: widget.appState.movies
                .where((movie) => widget.appState.isFavorite(movie.id))
                .map((movie) {
              return MovieCard(
                movie: movie,
                callerPage: "favorite",
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
