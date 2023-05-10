import 'package:flutter/material.dart';
import 'package:movie_recommend/core/constants.dart';
import 'package:movie_recommend/core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key,
  required this.nextPage,
  required this.previousPage}) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  //Default rating for now
  double rating = 5;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [Text(
            "Select a minimum rating\nranging from 1-10",
            style: theme.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${rating.ceil()}',style: theme.textTheme.headline2,),
                const Icon(Icons.star_rounded,color: Colors.amber,size: 62)
              ],
            ),
            const Spacer(),
            Slider(value: rating,
                min: 1,
                max: 10,
                divisions: 10,
                label: '${rating.ceil()}',
                onChanged: (value){
              setState(() {
                rating = value;
              });
            }),
            const Spacer(),
            PrimaryButton(onPressed: widget.nextPage, text:'Yes please'),
            const SizedBox(height: kMediumSpacing)
          ],
        ),
      ),

    );
  }
}
