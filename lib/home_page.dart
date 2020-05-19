import 'package:flutter/material.dart';
import 'package:timomovieflutter/app_state.dart';
import 'package:timomovieflutter/app_state_provider.dart';
import 'package:timomovieflutter/popular_page.dart';
import 'package:timomovieflutter/favorite_page.dart';
import 'package:timomovieflutter/top-movie_page.dart';
import 'package:timomovieflutter/top_rated.dart';
import 'theme.dart' as Style;

class HomePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _activePage = (_pageController.page + 0.5).floor();
      });
    });
  }

  void onTap(int index) {
    setState(() {
      _activePage = index;
    });
    _pageController.animateToPage(
      _activePage,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = AppStateProvider.of(context);
    return Scaffold(
      backgroundColor: Style.darkBlue,
      appBar: AppBar(
        leading: Icon(Icons.menu),

          title: Text("Timo Movie DB"),
          centerTitle: true,
          backgroundColor: Style.darkBlue,
          elevation: 0.0),
      body: PageView(
        controller: _pageController,
        children: [
          PopularPage(appState: appState),
          TopRatedPage(appState: appState),
          FavoritePage(appState: appState),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.darkBlue,
        fixedColor: Style.skyBlue,
        items: [
          BottomNavigationBarItem(
              title: Text("Popular"), icon: Icon(Icons.movie)),
          BottomNavigationBarItem(
              title: Text("Top"), icon: Icon(Icons.star)),
          BottomNavigationBarItem(
              title: Text("Favorite"), icon: Icon(Icons.favorite)),
        ],
        currentIndex: _activePage,
        onTap: (index) => onTap(index),
      ),
    );
  }
}
