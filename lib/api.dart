import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timomovieflutter/movie.dart';
import 'top_movie.dart';
import 'package:timomovieflutter/tools/api_key.dart';

class Api {
  static String popularUrl(int page) =>
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$key&language=en-US&page=$page";

  static String topUrl(int page) =>
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$key&language=en-US&page=$page";

  static String imageUrl(String path) => "https://image.tmdb.org/t/p/w500$path";

  static String movieUrl(String movieId) =>
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$key";

  static Future<List<Movie>> getMovies(int page) async {
    http.Response response = await http.get(popularUrl(page));
    Map<String, dynamic> decoded = json.decode(response.body);
    List<dynamic> lista = decoded['results'];
    List<Movie> movies = lista.map((movie) {
      return Movie.fromJson(movie);
    }).toList();
    return movies;
  }

  static Future<List<TopMovie>> getTopMovies(int page) async {
    http.Response response = await http.get(topUrl(page));
    Map<String, dynamic> decoded = json.decode(response.body);
    List<dynamic> lista = decoded['results'];
    List<TopMovie> topMovies = lista.map((movie) {
      return TopMovie.fromJson(movie);
    }).toList();
    return topMovies;
  }
  static Future<List<Movie>> getGenreMovies(int page) async {
    http.Response response = await http.get(popularUrl(page));
    Map<String, dynamic> decoded = json.decode(response.body);
    List<dynamic> lista = decoded['genres'];
    List<Movie> movies = lista.map((movie) {
      return Movie.fromJson(movie);
    }).toList();
    return movies;
  }

}
