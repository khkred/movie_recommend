import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommend/features/movie_flow/movie_flow.dart';
import 'theme/custom_theme.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref){
  return Dio(
    BaseOptions(baseUrl: "https://api.themoviedb.org/3/")
  );
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Recommender',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}
