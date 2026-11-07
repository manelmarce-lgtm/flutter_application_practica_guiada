class Movie {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage; // Cambiado de OriginalLanguage a String
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  bool video;
  double voteAverage;
  int voteCount;
  String title;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.title,
  });

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: (json["popularity"] as num).toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] as num).toDouble(),
        voteCount: json["vote_count"] ?? 0,
        title: json["title"] ?? '',
      );

  // Getter seguro para las imágenes del cartel
  String get fullPosterPath {
  if (posterPath != null && posterPath!.isNotEmpty) {
    return 'https://image.tmdb.org/w500$posterPath';
  }
  return 'https://via.placeholder.com/300x400';
}

  
  String get fullBackdropPath {
    if (backdropPath != null) {
      return 'https://image.tmdb.org/w500$backdropPath';
    }
    return 'https://via.placeholder.com/500x300';
  }
}