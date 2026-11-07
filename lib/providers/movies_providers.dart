
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/now_playing_response.dart';
import 'package:movies_app/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'de2a09a17d2ed51404265e50bfaf5868';
  final String _language = 'en-ES';
  final String _page = '1';

  List<Movie> onDisplayMovies = [];

  List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  getOnDisplayMovies() async {
    final url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': _page,
    });

    final result = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
  
  getPopularMovies() async {
    final url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _page,
    });

    final result = await http.get(url);
    final popularResponse = PopularResponse.fromJson(result.body);

    popularMovies = popularResponse.results;
    notifyListeners();
  
}
}