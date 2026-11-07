
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/now_playing_response.dart';


class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'de2a09a17d2ed51404265e50bfaf5868';
  String _language = 'en-ES';
  String _page = '1';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
  
  
}
