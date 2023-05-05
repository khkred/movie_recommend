import 'package:flutter/material.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
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
              onPressed: nextPage,
              text: 'Get Started'
            ),
            const Divider(height: kButtonBottomDivider,)
          ],
        ),
      ),
    );
  }
}
