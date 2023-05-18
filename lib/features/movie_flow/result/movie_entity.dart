
class MovieEntity {
  final String title;
  final String overview;
  final num voteAverage;
  final List<int> genreIds;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieEntity({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
        title: map['title'],
        overview: map['overview'],
        voteAverage: map['vote_average'],
        genreIds: List.from(map['genre_ids']),
        releaseDate: map['release_date'],
    backdropPath: map['backdrop_path'],
    posterPath: map['poster_path'],);
  }


  @override
  String toString() {
    return 'MovieEntity{title: $title, overview: $overview, voteAverage: $voteAverage, genreIds: $genreIds, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          overview == other.overview &&
          voteAverage == other.voteAverage &&
          genreIds == other.genreIds &&
          releaseDate == other.releaseDate &&
          backdropPath == other.backdropPath &&
          posterPath == other.posterPath;

  @override
  int get hashCode =>
      title.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode ^
      genreIds.hashCode ^
      releaseDate.hashCode ^
      backdropPath.hashCode ^
      posterPath.hashCode;
}
