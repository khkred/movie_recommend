import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';
import 'package:movie_recommend/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommend/features/movie_flow/result/result_screen.dart';

class YearBackScreen extends ConsumerWidget {
  const YearBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "No. of years back",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.read(movieFlowControllerProvider).yearsBack.ceil()}',
                  style: theme.textTheme.displayMedium,
                ),
                Text(
                  'Years Back',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.textTheme.headlineMedium?.color?.withOpacity(0.62),
                  ),
                )
              ],
            ),
            const Spacer(),
            Slider(
                value:
                    ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
                min: 1,
                max: 70,
                divisions: 70,
                label:
                    '${ref.watch(movieFlowControllerProvider).yearsBack.toDouble().ceil()}',
                onChanged: (value) {
                  ref
                      .read(movieFlowControllerProvider.notifier)
                      .updateYearsBack(value.toInt());
                  debugPrint("Movie years back: $value");
                }),
            const Spacer(),
            PrimaryButton(
                onPressed: () async{
                  await ref.read(movieFlowControllerProvider.notifier).getRecommendedMovie();
                  Navigator.of(context).push(ResultScreen.route());
                },
                isLoading: ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
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
