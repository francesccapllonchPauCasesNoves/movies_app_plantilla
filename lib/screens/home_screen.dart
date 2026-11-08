import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/movies_search.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovie);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartellera'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              final movie = await showSearch<Movie?>(
                context: context,
                delegate: MoviesSearch(moviesProvider),
              );
              if (!context.mounted || movie == null) return;
              Navigator.pushNamed(context, 'details', arguments: movie);
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Targetes principals
            CardSwiper(movies: moviesProvider.onDisplayMovie),

            // Slider de pel·licules
            MovieSlider(movies: moviesProvider.onPopularMovie),
            // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
            // MovieSlider(),
            // MovieSlider(),
          ],
        ),
      ),
    );
  }
}

