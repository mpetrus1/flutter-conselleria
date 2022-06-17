import 'package:flutter/material.dart';
import 'package:projecte_final/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {
  final int idMovie;

  const CastingCards({super.key, required this.idMovie});
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    
    moviesProvider.getMovieCast(idMovie);
    List<Cast>? cast = moviesProvider.casting[idMovie]!;
  
    
    if (cast.isEmpty) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>
              _CastCard(cast: cast[index])),
    );
    ;
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(cast.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
