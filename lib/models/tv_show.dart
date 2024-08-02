class TVShow {
  String name;
  String backDrop;
  String originalName;
  String overview;
  String posterPath;
  String firstAirDate;
  double voteAverage;

  TVShow({
    required this.name,
    required this.backDrop,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
  });

  factory TVShow.fromJson(Map<String, dynamic> json) {
    return TVShow(
      name: json["name"],
      backDrop: json["backdrop_path"],
      originalName: json["original_name"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      firstAirDate: json["first_air_date"].toString(),
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
