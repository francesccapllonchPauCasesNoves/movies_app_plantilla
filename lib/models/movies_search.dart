import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';

class MoviesSearch extends SearchDelegate<Movie?> {

  final MoviesProvider moviesProvider;
  String _lastQuery = '';
  Future<List<Movie>>? _searchFuture;

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
    final searchQuery = query.trim();
    if (searchQuery.isEmpty) {
      return const Center(child: Text('Escribe el título de una película'));
    }

    if (_lastQuery != searchQuery) {
      _lastQuery = searchQuery;
      _searchFuture = moviesProvider.getOnSearchedMovie(searchQuery);
    }

    return FutureBuilder<List<Movie>>(
      future: _searchFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('No se pudo realizar la búsqueda'));
        }

        final movies = snapshot.data ?? [];
        if (movies.isEmpty) {
          return const Center(child: Text('No se encontraron películas'));
        }
        return _movieResults(context, movies);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Center(child: Text('Busca una película por su título'));
    }

    final suggestions = moviesProvider.onDisplayMovie.where((movie) {
      return movie.title.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();

    if (suggestions.isEmpty) {
      return const Center(child: Text('Pulsa buscar para consultar TMDB'));
    }
    return _movieResults(context, suggestions);
  }

  Widget _movieResults(BuildContext context, List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
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
