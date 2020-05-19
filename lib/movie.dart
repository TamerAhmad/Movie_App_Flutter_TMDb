class Movie {
  final String title;
  final int id;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String date;
  final String language;
  final String imdbURL;
  final bool adult;
  final int budget;
  final int revenue;
  final double popularity;
  final String homepage;
  final int voteCount;
  final int runtime;
  var m;

  Movie(
      this.title,
      this.id,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.date,
      this.language,
      this.imdbURL,
      this.adult,
      this.budget,
      this.revenue,
      this.popularity,
      this.homepage,
      this.voteCount,
      this.runtime);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'],
        voteAverage = json['vote_average'] + .0,
        date = json['release_date'],
        language = json['original_language'],
        imdbURL = json['imdb_id'],
        adult = json['adult'],
        budget = json['budget'],
        revenue = json['revenue'],
        popularity = json['popularity'],
        homepage = json['homepage'],
        voteCount = json['vote_count'],
        runtime = json['runtime'],
        m = json;
}
