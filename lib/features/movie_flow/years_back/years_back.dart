import 'package:flutter/material.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';
import 'package:movie_recommend/features/movie_flow/result/result_screen.dart';

class YearBackScreen extends StatefulWidget {
  const YearBackScreen(
      {required this.nextPage, required this.previousPage, Key? key})
      : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<YearBackScreen> createState() => _YearBackScreenState();
}

class _YearBackScreenState extends State<YearBackScreen> {
  double yearsBack = 10;

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
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${yearsBack.ceil()}',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Years Back',
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                )
              ],
            ),
            const Spacer(),
            Slider(
                value: yearsBack,
                min: 0,
                max: 70,
                divisions: 70,
                label: '${yearsBack.ceil()}',
                onChanged: (value) {
                  setState(() {
                    yearsBack = value;
                  });
                }),
            const Spacer(),
            PrimaryButton(
                onPressed: () =>
                    Navigator.of(context).push(ResultScreen.route()),
                text: 'Results'),
            const SizedBox(
              height: kMediumSpacing,
            )
          ],
        ),
      ),
    );
  }
}
