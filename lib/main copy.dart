import 'package:tmdb_api/tmdb_api.dart';

Future<void> main(List<String> args) async {
  //api with out console logs
  final tmdb = TMDB(ApiKeys('ce6dac274f89a8eb501c55508157e49f',
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTZkYWMyNzRmODlhOGViNTAxYzU1NTA4MTU3ZTQ5ZiIsInN1YiI6IjY1ZjQzMWZhYTMxM2I4MDBlNDI2MWYwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gMHYeFkU_0uD0Kd6idZJm3PyvnlyPUYP_4UBeJPXkuI'));
  print(await tmdb.v3.movies.getPopular());

  //api with showing all console logs
  final tmdbWithLogs = TMDB(
    ApiKeys('ce6dac274f89a8eb501c55508157e49f',
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTZkYWMyNzRmODlhOGViNTAxYzU1NTA4MTU3ZTQ5ZiIsInN1YiI6IjY1ZjQzMWZhYTMxM2I4MDBlNDI2MWYwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gMHYeFkU_0uD0Kd6idZJm3PyvnlyPUYP_4UBeJPXkuI'),
    logConfig: const ConfigLogger.showAll(),
  );
  print(await tmdbWithLogs.v3.movies.getPopular());

  //api with showing all console logs
  final tmdbWithCustomLogs = TMDB(
    ApiKeys('ce6dac274f89a8eb501c55508157e49f',
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTZkYWMyNzRmODlhOGViNTAxYzU1NTA4MTU3ZTQ5ZiIsInN1YiI6IjY1ZjQzMWZhYTMxM2I4MDBlNDI2MWYwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gMHYeFkU_0uD0Kd6idZJm3PyvnlyPUYP_4UBeJPXkuI'),
    logConfig: const ConfigLogger(
      //must be true than only all other logs will be shown
      showLogs: true,
      showErrorLogs: true,
    ),
  );
  print(await tmdbWithCustomLogs.v3.movies.getPopular());
}
