class Movie {
  String title;
  String backDrop;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDrop,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDrop: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"].toString(),
      voteAverage: json["vote_average"].toDouble(),
    );
  }
} 

      // "adult": false,
      // "backdrop_path": "/8uVKfOJUhmybNsVh089EqLHUYEG.jpg",
      // "id": 693134,
      // "title": "Dune: Part Two",
      // "original_language": "en",
      // "original_title": "Dune: Part Two",
      // "overview": "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
      // "poster_path": "/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg",
      // "media_type": "movie",
      // "genre_ids": [
      //   878,
      //   12
      // ],
      // "popularity": 988.989,
      // "release_date": "2024-02-27",
      // "video": false,
      // "vote_average": 8.42,
      // "vote_count": 1641