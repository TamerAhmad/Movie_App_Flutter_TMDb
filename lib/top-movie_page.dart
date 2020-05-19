import 'package:flutter/material.dart';
import 'app_state.dart';
import 'top_movie.dart';
import 'theme.dart' as Style;
import 'api.dart';

class TopMoviePage extends StatefulWidget {

  final TopMovie topMovie;

  final AppState appState;

  // This is used for the hero animation
  final String callerPage;

  TopMoviePage({
    @required this.topMovie,
    @required this.appState,
    @required this.callerPage,
  })  : assert(topMovie != null),
        assert(appState != null),
        assert(callerPage != null);


  @override
  TopMoviePageState createState() {
    return new TopMoviePageState();
  }
}


class TopMoviePageState extends State<TopMoviePage>{
  bool favorite = false;


  @override
  void initState() {
    super.initState();
    favorite = widget.appState.isFavorite(widget.topMovie.id);
  }

  void onFavorite() {
    setState(() {
      favorite = !favorite;
      if (favorite)
        widget.appState.addFavorite(widget.topMovie.id);
      else
        widget.appState.removeFavorite(widget.topMovie.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                              Api.imageUrl(widget.topMovie.backdropPath)),
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
                              tag: "${widget.callerPage}${widget.topMovie.id}",
                              child: Container(
                                height: 200.0,
                                width: 150.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(Api.imageUrl(
                                          widget.topMovie.posterPath)),
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
                                      widget.topMovie.date.substring(0, 4),
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
                                      widget.topMovie.voteAverage.toString()+'/10',
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
                                      widget.topMovie.language.toUpperCase(),
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
                                widget.topMovie.title,
                                style: TextStyle(
                                  color: Style.lightGrey,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: onFavorite,
                              icon: favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                              iconSize: 35.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          widget.topMovie.overview,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
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