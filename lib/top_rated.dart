import 'package:flutter/material.dart';
import 'app_state.dart';
import 'top_movie.dart';
import 'api.dart';
import 'movie_card.dart';
import 'top_movie_card.dart';

class TopRatedPage extends StatefulWidget {

  final AppState appState;

  TopRatedPage({@required this.appState}) : assert(appState != null);

  @override
  _TopRatedPageState createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage>
    with AutomaticKeepAliveClientMixin<TopRatedPage>{


  @override
  void initState() {
    super.initState();
    if (widget.appState.topMovies.isEmpty) getMoreItems();
  }

  getMoreItems() async {
    List<TopMovie> topMovies = await Api.getTopMovies(++widget.appState.lastPage);
    widget.appState.topMovies.addAll(topMovies);
    setState(() {});
  }

  Widget _buildTopList() {
    if (widget.appState.topMovies.isEmpty)
      return Center(child: CircularProgressIndicator());
    else
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index < widget.appState.topMovies.length) {
            return TopMoviesCard(
              topMovie: widget.appState.topMovies[index],
              callerPage: "top_rated",
            );
          } else {
            getMoreItems();
            return Center(child: CircularProgressIndicator());
          }
        },
        itemCount: widget.appState.topMovies.length + 1,
      );
  }


  @override
  Widget build(BuildContext context) {
    return _buildTopList();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
