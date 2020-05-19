class TopMovie {
  final String title;
  final int id;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String date;
  final String language;

  TopMovie(this.title, this.id, this.overview, this.posterPath, this.backdropPath,
      this.voteAverage, this.date,this.language);

  TopMovie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'],
        voteAverage = json['vote_average']+.0,
        date = json['release_date'],
        language = json['original_language'];
}