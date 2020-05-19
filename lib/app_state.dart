import 'package:timomovieflutter/movie.dart';
import 'package:timomovieflutter/top_movie.dart';

class AppState {
  List<int> favorite = [];

  List<Movie> movies = [];

  List<TopMovie> topMovies = [];

  int lastPage = 0;

  addFavorite(int id) {
    if (!favorite.contains(id)) favorite.add(id);
  }

  removeFavorite(int id) {
    if (favorite.contains(id)) favorite.remove(id);
  }

  bool isFavorite(int id) {
    return favorite.contains(id);
  }
}
