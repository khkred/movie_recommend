import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';
import 'package:movie_recommend/features/movie_flow/movie_flow_controller.dart';

class LandingScreen extends ConsumerWidget {
  const   LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Let's find a movie",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            Image.asset('images/horror-movie.png'),
            const Spacer(),
            PrimaryButton(
              onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: 'Get Started'
            ),
            const Divider(height: kButtonBottomDivider,)
          ],
        ),
      ),
    );
  }
}
