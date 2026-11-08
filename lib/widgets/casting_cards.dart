import 'package:flutter/material.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int idMovie;

  const CastingCards(this.idMovie);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);

    return FutureBuilder(
      future: moviesProvider.getOnMovieCast(idMovie),
        builder: ((BuildContext context, AsyncSnapshot<List<Cast>> snapshot){
          if(!snapshot.hasData){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          }

          final casting = snapshot.data;

          
          
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 200,
            // color: Colors.red,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => _CastCard(casting![index])),
          );
        } 
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast card;

  _CastCard(this.card);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(card.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            card.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
