

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier{
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '3df87dc5ae283d06fdad09b889bd12a5';
  final String _language = 'es-ES';
  final String _page = '1';

  List<Movie> onDisplayMovie = [];
  List<Movie> onPopularMovie = [];
  List<Movie> onSearchedMovie = [];
  

  Map<int, List<Cast>> casting = {};


  MoviesProvider() {
    print('MoviesProvider inicializat!');
    getOnDisplayMovies();
    getOnPopularMovies();
  }

  Future<void> getOnDisplayMovies() async{
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

  Future<void> getOnPopularMovies() async{
    print('getOnPopularMovies');
    var url = 
    Uri.https(_baseUrl, '3/movie/popular',  {
      'api_key': _apiKey,
      'language':_language,
      'page':_page
    });

    final result = await http.get(url);


    final popularResponse = PopularResponse.fromJson(result.body);

    onPopularMovie = popularResponse.results;

    notifyListeners();
  }

  Future<List<Cast>> getOnMovieCast(int isMovie) async{


    print('Demanam info al servidor!');
    var url = 
    Uri.https(_baseUrl, '3/movie/$isMovie/credits',  {
      'api_key': _apiKey,
      'language':_language
    });
    
    final result = await http.get(url);

    final creditsResponse = CreditsResponse.fromJson(result.body);

    casting[isMovie] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<void> getOnSearchedMovie() async{
    print('getOnSearchedMovie');
    var url = 
    Uri.https(_baseUrl, '3/search/movie',  {
      'api_key': _apiKey,
      'language':_language,
    });

    final result = await http.get(url);


    final popularResponse = PopularResponse.fromJson(result.body);

    onSearchedMovie = popularResponse.results;

    notifyListeners();
  } 
}



