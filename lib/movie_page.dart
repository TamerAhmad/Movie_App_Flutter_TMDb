import 'package:flutter/material.dart';
import 'package:timomovieflutter/app_state.dart';
import 'package:timomovieflutter/api.dart';
import 'package:timomovieflutter/movie.dart';
import 'package:timomovieflutter/tools/movie_json.dart';
import 'package:timomovieflutter/tools/movies_json.dart';
import 'theme.dart' as Style;
import 'widgets.dart';


class MoviePage extends StatefulWidget {
  final Movie movie;

  final AppState appState;

  // This is used for the hero animation
  final String callerPage;

  MoviePage({
    @required this.movie,
    @required this.appState,
    @required this.callerPage,
  })  : assert(movie != null),
        assert(appState != null),
        assert(callerPage != null);

  @override
  MoviePageState createState() {
    return new MoviePageState();
  }
}

class MoviePageState extends State<MoviePage> {
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    favorite = widget.appState.isFavorite(widget.movie.id);
  }

  String getAdult() {
    if (widget.movie.adult == false) {
      return 'This film is suitable for Family';
    } else {
      return 'This film is for Adult only';
    }
  }

  void onFavorite() {
    setState(() {
      favorite = !favorite;
      if (favorite)
        widget.appState.addFavorite(widget.movie.id);
      else
        widget.appState.removeFavorite(widget.movie.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.darkBlue,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              Api.imageUrl(widget.movie.backdropPath)),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFF000000)],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 130.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: "${widget.callerPage}${widget.movie.id}",
                              child: Container(
                                height: 200.0,
                                width: 150.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(Api.imageUrl(
                                          widget.movie.posterPath)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      size: 30.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      widget.movie.date.substring(0, 4),
                                      style: TextStyle(
                                        color: Style.lightGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ('BalooTammudu2'),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      widget.movie.voteAverage.toString()+'/10',
                                      style: TextStyle(
                                        color: Style.lightGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ('BalooTammudu2'),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.language,
                                      size: 30.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      widget.movie.language.toUpperCase(),
                                      style: TextStyle(
                                        color: Style.lightGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ('BalooTammudu2'),
                                      ),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                widget.movie.title,
                                style: TextStyle(
                                  color: Style.lightGrey,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: onFavorite,
                              icon: favorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                              iconSize: 35.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          widget.movie.overview,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text('Family check: ${getAdult()}',style: TextStyle(
                          fontSize: 16.0,
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                brightness: Brightness.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
