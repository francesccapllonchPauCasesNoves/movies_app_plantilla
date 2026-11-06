
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/movie.dart';

class MoviesProvider extends ChangeNotifier{
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '3df87dc5ae283d06fdad09b889bd12a5';
  String _language = 'es-ES';
  String _page = '1';

  List<Movie> onDisplayMovie = [];

  MoviesProvider() {
    print('MoviesProvider inicializat!');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
    print('getOnDisplayMovies');
    var url = 
    Uri.https(_baseUrl, '3/movie/now_playing',  {
      'api_key': _apiKey,
      'language':_language,
      'page':_page
    });

    final result = await http.get(url);


    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayMovie = nowPlayingResponse.results;

    notifyListeners();
  }
}

