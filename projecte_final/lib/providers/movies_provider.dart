import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/models.dart';
import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
String _baseUrl='api.themoviedb.org';
String _apiKey='809863a72949fbe3c7ec098439f6c346';
String _language ='en-US';
String _page='1';

List<Movie> onDisplayMovies = [];
List<Movie> popularMovies = [];
List<Movie> topRatedMovies = [];

Map<int, List<Cast>> casting ={};


  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getPopularMovies();
    this.getTopRatedMovies();
    
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': _page,});

    // Await the http get response, then decode the json-formatted response.
    
    final result = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();

  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _page,});

    // Await the http get response, then decode the json-formatted response.
    
    final result = await http.get(url);

    final popularResponse = PopularResponse.fromJson(result.body);

    popularMovies = popularResponse.results;

    notifyListeners();

  }

  getTopRatedMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/top_rated', {
      'api_key': _apiKey,
      'language': _language,
      'page': _page,});

    // Await the http get response, then decode the json-formatted response.
    
    final result = await http.get(url);

    final topRatedResponse = TopRatedResponse.fromJson(result.body);

    topRatedMovies = topRatedResponse.results;

    notifyListeners();

  }

  // Future <List<Cast>> getMovieCast(int idMovie) async{
  //   var url = Uri.https(_baseUrl, '3/movie/$idMovie/credits', {
  //     'api_key': _apiKey,
  //     'language': _language,
  //     });

  //   // Await the http get response, then decode the json-formatted response.
    
  //   final result = await http.get(url);

  //   final creditsResponse = CreditsResponse.fromJson(result.body);

  //   casting[idMovie] = creditsResponse.cast;
  //   notifyListeners();
  //   return creditsResponse.cast;
  // }



  getMovieCast(int idMovie) async{
    var url = Uri.https(_baseUrl, '3/movie/$idMovie/credits', {
      'api_key': _apiKey,
      'language': _language,
      });

    // Await the http get response, then decode the json-formatted response.
    
    final result = await http.get(url);

    final creditsResponse = CreditsResponse.fromJson(result.body);

    casting[idMovie] = creditsResponse.cast;
    
    notifyListeners();
    
  }
}
