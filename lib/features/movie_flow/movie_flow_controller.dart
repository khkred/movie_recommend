import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommend/features/movie_flow/genre/genre.dart';
import 'package:movie_recommend/features/movie_flow/movie_flow_state.dart';

//Here's the provider
final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
        (ref) {
  return MovieFlowController(MovieFlowState(
    pageController: PageController(),
  ));
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state) : super(state);

  void toggleSelected(Genre genre) {
    state = state.copyWith(genres: [
      for (final oldGenre in state.genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ]);
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
      if (!state.genres.any((element) => element.isSelected == true)) {
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
