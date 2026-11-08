import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';

class MoviesSearch extends SearchDelegate{

  final MoviesProvider moviesProvider;

  MoviesSearch(this.moviesProvider);


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _movieResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _movieResults();
  }

  Widget _movieResults() {
    final filteredMovies = moviesProvider.onDisplayMovie.where((movie) {
      final title = movie.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = filteredMovies[index];
        return ListTile(
          title: Text(movie.title),
          onTap: () {
            close(context, movie);
          },
        );
      },
    );
  }    
}
