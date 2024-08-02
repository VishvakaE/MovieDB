import "dart:convert";
import "package:moviedb/constants.dart";
import "package:moviedb/models/movie.dart";
import "package:moviedb/models/tv_show.dart";
import "package:http/http.dart" as http;

class API {
  static const _apiKey = Constants.apiKey;
  static const _baseUrl = 'https://api.themoviedb.org/3';
  static const _searchUrl = '$_baseUrl/search/movie';
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/week?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _topRatedTVShowUrl =
      'https://api.themoviedb.org/3/account/21105818/rated/tv?api_key=${Constants.apiKey}';

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse('$_searchUrl?api_key=$_apiKey&query=$query');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something has gone wrong');
    }
  }

  Future<List<TVShow>> getTopRatedTVShows() async {
    final response = await http.get(Uri.parse(_topRatedTVShowUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((tvshow) => TVShow.fromJson(tvshow)).toList();
    } else {
      throw Exception('Something has gone wrong');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something has gone wrong');
    }
  }

  Future<List<Movie>> getUpcoming() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something has gone wrong');
    }
  }
}
