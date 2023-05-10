import 'package:flutter/material.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';
import 'package:movie_recommend/features/movie_flow/genre/genre.dart';
import 'package:movie_recommend/features/movie_flow/result/movie.dart';

class ResultScreen extends StatelessWidget {
  static route({bool fullScreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      );

  const ResultScreen({Key? key}) : super(key: key);

  final movie = const Movie(
    title: 'The Hulk',
    overview:
        'Bruce Banner, a genetics researcher with a tragic past suffers an accident',
    voteAverage: 4.8,
    genres: [Genre(name: 'Action'), Genre(name: 'Fantasy')],
    releaseDate: '2019-05-24',
    backdropPath: '',
    posterPath: '',
  );
  final double movieHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CoverImage(),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: -(movieHeight / 2),
                    child: MovieImageDetails(
                      movie: movie,
                      movieHeight: movieHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(height: movieHeight / 2),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          )),
          PrimaryButton(
              onPressed: () => Navigator.of(context).pop(),
              text: 'Find another movie'),
          const SizedBox(height: kMediumSpacing),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(begin: Alignment.center, colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.transparent,
          ]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget {
  const MovieImageDetails(
      {Key? key, required this.movie, required this.movieHeight})
      : super(key: key);

  final Movie movie;
  final double movieHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(),
          ),
          const SizedBox(
            width: kMediumSpacing,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: theme.textTheme.headline6,
              ),
              Text(
                movie.genresCommaSeparated,
                style: theme.textTheme.bodyMedium,
              ),
              Row(
                children: [
                  Text(
                    '4.8',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color:
                          theme.textTheme.bodyMedium?.color?.withOpacity(0.62),
                    ),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.amber,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
