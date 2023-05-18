import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommend/features/movie_flow/genre/genre.dart';
import 'package:movie_recommend/features/movie_flow/movie_flow_state.dart';
import 'package:movie_recommend/features/movie_flow/movie_service.dart';
import 'package:movie_recommend/features/movie_flow/result/movie.dart';

//Here's the provider
final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
        (ref) {
  return MovieFlowController(
    MovieFlowState(
        pageController: PageController(),
        movie: AsyncValue.data(Movie.initial()),
        genres: const AsyncValue.data([])),
    ref.watch(movieServiceProvider),
  );
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state, this._movieService) : super(state) {
    loadGenres();
  }

  final MovieService _movieService;

  Future<void> loadGenres() async {
    state = state.copyWith(genres: const AsyncValue.loading());
    final result = await _movieService.getGenres();

    result.when((genres){
      final updatedGenres = AsyncValue.data(genres);
      state = state.copyWith(genres: updatedGenres);

    }, (error) {
      //TODO: See if this will cause an error in the future
      state = state.copyWith(genres: AsyncValue.error(error,StackTrace.current));
    });
  }

  Future<void> getRecommendedMovie() async {
    state = state.copyWith(movie: const AsyncValue.loading());
    //Get the selected genres
    final selectedGenres = state.genres.value
            ?.where((element) => element.isSelected == true)
            .toList(growable: false) ??
        [];

    final result = await _movieService.getRecommendedMovie(
        state.rating, state.yearsBack, selectedGenres);

    result.when((movie) {
      final updatedMovie = AsyncValue.data(movie);
      state = state.copyWith(movie: updatedMovie);
    }, (error) {
      state = state.copyWith(movie: AsyncValue.error(error, StackTrace.current));
    });
  }

  void toggleSelected(Genre genre) {
    state = state.copyWith(
      genres: AsyncValue.data([
        for (final oldGenre in state.genres.value!)
          if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ]),
    );
  }

  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void nextPage() {
    //We are making sure that the page is not a null page
    if (state.pageController.page! >= 1) {
      //We are also making sure that at least one Genre is selected
      if (!state.genres.value!.any((element) => element.isSelected == true)) {
        return;
      }
    }

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }

//We also have to dispose the page controller
}
