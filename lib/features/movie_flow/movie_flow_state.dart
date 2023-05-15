import 'package:flutter/material.dart';
import 'package:movie_recommend/features/movie_flow/genre/genre.dart';
import 'package:movie_recommend/features/movie_flow/result/movie.dart';

const movieMock = Movie(
    title: 'Dungeons & Dragons: Honor Among Thieves (2023)',
    overview:
        "A charming thief and a band of unlikely adventurers undertake an epic heist to retrieve a lost relic, but things go dangerously awry when they run afoul of the wrong people.",
    voteAverage: 4,
    genres: [
      Genre(name: "Adventure"),
      Genre(name: "Fantasy"),
      Genre(name: "Comedy")
    ],
    releaseDate: "03/31/2023");

const genresMock = [
  Genre(name: "Adventure"),
  Genre(name: "Fantasy"),
  Genre(name: "Comedy"),
  Genre(name: "Action"),
  Genre(name: "Thriller"),
  Genre(name: "Mystery"),
  Genre(name: "Romance"),
  Genre(name: "Horror"),
  Genre(name: "Science Fiction"),
  Genre(name: "Drama"),
  Genre(name: "Historical Fiction"),
  Genre(name: "Crime"),
  Genre(name: "Western"),
  Genre(name: "War"),
  Genre(name: "Superhero"),
  Genre(name: "Animation"),
  Genre(name: "Musical"),
  Genre(name: "Sports"),
  Genre(name: "Documentary")
];

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.genres = genresMock,
    this.rating = 5,
    this.yearsBack = 10,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieFlowState &&
          runtimeType == other.runtimeType &&
          pageController == other.pageController &&
          rating == other.rating &&
          yearsBack == other.yearsBack &&
          genres == other.genres &&
          movie == other.movie;

  @override
  int get hashCode =>
      pageController.hashCode ^
      rating.hashCode ^
      yearsBack.hashCode ^
      genres.hashCode ^
      movie.hashCode;
}
