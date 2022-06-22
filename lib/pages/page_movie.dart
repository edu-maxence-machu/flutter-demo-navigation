import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/models/movie.dart';

class PageMovie extends StatelessWidget {
  const PageMovie({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.movieTitle),
        ),
        body: SingleChildScrollView(
            child: Container(
                width: _size.width,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: _size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(movie.getImargeUrl()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 10, right: 10),
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movie.movieTitle,
                                        style: TextStyle(fontSize: 30)),
                                    Divider(),
                                    Text('Synopsis',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(movie.movieOverview,
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                    Divider(),
                                  ]))
                        ])))));
  }
}
