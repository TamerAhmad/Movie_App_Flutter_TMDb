import 'package:flutter/material.dart';
import 'top_movie.dart';
import 'movie_page.dart';
import 'top-movie_page.dart';
import 'theme.dart' as Style;
import 'app_state_provider.dart';
import 'api.dart';
class TopMoviesCard extends StatelessWidget {

  final TopMovie topMovie;

  final String callerPage;

  TopMoviesCard({@required this.topMovie, @required this.callerPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TopMoviePage(
                topMovie: topMovie,
                appState: AppStateProvider.of(context),
                callerPage: callerPage,
              );
            }),
          );
        },
        child: Card(
          elevation: 3.0,
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                tag: "${callerPage}${topMovie.id}",
                child: Container(
                  width: 90.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(5.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                          "${Api.imageUrl(topMovie.posterPath)}",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 120.0,
                  color: Style.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            topMovie.title,
                            style: TextStyle(
                              color: Style.lightGrey,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/calendar.png'),
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                SizedBox(width: 15.0,),
                                Text(
                                  topMovie.date.substring(0, 4),
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
                            SizedBox(width: 15.0,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star,size: 30.0,),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  topMovie.voteAverage.toString(),
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
                            SizedBox(width: 15.0,),
                            Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/lan.png'),
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                SizedBox(width: 20.0,),
                                Text(
                                  topMovie.language.toUpperCase(),
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
                        SizedBox(
                          height: 15.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
