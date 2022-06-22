import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/pages/page_contact.dart';
import 'package:flutter_navigation_starter/models/movie.dart';
import 'package:flutter_navigation_starter/pages/page_movie.dart';
import 'package:flutter_navigation_starter/utils/api_movie.dart';
import 'package:flutter_navigation_starter/widgets/movie_preview.dart';

class PageHome extends StatefulWidget {
  PageHome({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<PageHome> createState() => _PageHomeState();
}

enum StatusApi { chargement, error, ok }

class _PageHomeState extends State<PageHome> {
  List<Movie> movies = [];
  StatusApi? _statusApi;

  @override
  void initState() {
    getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StatusApi _statusApi;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, i) {
              Movie movie = movies[i];
              return MoviePreview(movie: movie);
            }));
  }

  Future<void> getPopularMovies() async {
    setState(() {
      _statusApi = StatusApi.chargement;
    });
    ApiMovie api = ApiMovie();
    Map<String, dynamic> mapMovie = await api.getPopular();
    if (mapMovie["code"] == 0) {
      // Je peux concevoir ma liste de Movie
      setState(() {
        movies = Movie.moviesFromApi(mapMovie["body"]);
        _statusApi = StatusApi.ok;
      });
    } else {
      setState(() {
        _statusApi = _statusApi = StatusApi.error;
      });
    }
  }
}
