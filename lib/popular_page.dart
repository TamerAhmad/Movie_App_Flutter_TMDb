import 'package:flutter/material.dart';
import 'package:timomovieflutter/app_state.dart';
import 'package:timomovieflutter/movie_card.dart';
import 'package:timomovieflutter/api.dart';
import 'package:timomovieflutter/movie.dart';

class PopularPage extends StatefulWidget {
  final AppState appState;

  PopularPage({@required this.appState}) : assert(appState != null);

  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage>
    with AutomaticKeepAliveClientMixin<PopularPage> {
  @override
  void initState() {
    super.initState();
    if (widget.appState.movies.isEmpty) getMoreItems();
  }

  getMoreItems() async {
    List<Movie> movies = await Api.getMovies(++widget.appState.lastPage);
    widget.appState.movies.addAll(movies);
    List<Movie> movies2 = await Api.getGenreMovies(++widget.appState.lastPage);
    widget.appState.movies.addAll(movies2);
    setState(() {});
  }

  Widget _buildPopularList() {
    if (widget.appState.movies.isEmpty)
      return Center(child: CircularProgressIndicator());
    else
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index < widget.appState.movies.length) {
            return MovieCard(
              movie: widget.appState.movies[index],
              callerPage: "popular",
            );
          } else {
            getMoreItems();
            return Center(child: CircularProgressIndicator());
          }
        },
        itemCount: widget.appState.movies.length + 1,
      );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPopularList();
  }

  @override
  bool get wantKeepAlive => true;
}
