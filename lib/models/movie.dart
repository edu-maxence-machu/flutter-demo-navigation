class Movie {
  final int movieId;
  final String movieTitle;
  final String movieOverview;
  final DateTime movieReleaseDate;
  final String movieImageUrl;
  final double? movieVote;

  Movie(this.movieId, this.movieTitle, this.movieOverview, this.movieImageUrl,
      this.movieReleaseDate, this.movieVote);

  static List<Movie> moviesFromApi(Map<String, dynamic> body) {
    List<Movie> l = [];
    // Le body API nous retourne 4 noeud dont un qui est intéressant : results
    List<dynamic> results = body["results"];
    results.forEach((value) {
      Movie movie = Movie(
          value["id"],
          value["title"],
          value["overview"],
          value["poster_path"],
          DateTime.parse(value["release_date"]),
          double.tryParse(value["vote_average"].toString()));

      l.add(movie);
    });
    return l;
  }

  String getImargeUrl() {
    return "https://image.tmdb.org/t/p/w500$movieImageUrl";
  }
}
