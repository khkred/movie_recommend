import 'package:flutter/material.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';
import 'package:movie_recommend/features/movie_flow/genre/genre.dart';
import 'package:movie_recommend/features/movie_flow/genre/list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen(
      {Key? key, required this.nextPage, required this.previousPage})
      : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Drama'),
    Genre(name: 'Romance'),
    Genre(name: 'Horror'),
    Genre(name: 'Thriller'),
    Genre(name: 'Sci-Fi'),
    Genre(name: 'Fantasy'),
    Genre(name: 'Documentary'),
    Genre(name: 'Animation'),
    Genre(name: 'Musical'),
    Genre(name: 'Mystery'),
    Genre(name: 'Crime'),
    Genre(name: 'Western'),
    Genre(name: 'Historical'),
    Genre(name: 'War'),
    Genre(name: 'Sports'),
    Genre(name: 'Family'),
    Genre(name: 'Adventure'),
    Genre(name: 'Biography'),
    Genre(name: 'Experimental'),
    Genre(name: 'Art House'),
    Genre(name: 'Erotic'),
    Genre(name: 'Foreign Language'),
    Genre(name: 'Independent'),
    Genre(name: 'Short')
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];

    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Let's start with a genre",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(vertical: kListItemSpacing),
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      return ListCard(
                        genre: genre,
                        onTap: () => toggleSelected(genre),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: kListItemSpacing,
                      );
                    },
                    itemCount: genres.length)),
            PrimaryButton(
              onPressed: widget.nextPage,
              text: 'Continue',
            ),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
