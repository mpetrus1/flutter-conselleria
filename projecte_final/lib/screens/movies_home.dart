import 'package:flutter/material.dart';
import 'package:projecte_final/providers/movies_provider.dart';
import 'package:projecte_final/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MoviesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    

    return Scaffold(
      appBar: AppBar(
        title: Text('On Display'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [

            // Targetes principals
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            
            // Slider de pel·licules
            MovieSlider(movies: moviesProvider.popularMovies, category: 'Popular',),
            MovieSlider(movies: moviesProvider.topRatedMovies, category: 'Top Rated'),
            
            // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
            // MovieSlider(),
            // MovieSlider(),

          ],
        )
      )
    );
  }
}
