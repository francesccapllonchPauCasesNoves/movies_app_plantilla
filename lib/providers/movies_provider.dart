
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{
  MoviesProvider() {
    print('MoviesProvider inicializat!');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies()async{
    print('getOnDisplayMovies');
  }
}