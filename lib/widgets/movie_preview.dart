import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/models/movie.dart';
import 'package:flutter_navigation_starter/pages/page_movie.dart';

class MoviePreview extends StatelessWidget {
  const MoviePreview({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
          elevation: 2.0,
          // InkWell car on a besoin d'un onTap pour aller sur une autre vue
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return PageMovie(movie: movie);
              }));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    // image background child
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(movie.getImargeUrl()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.movieTitle,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
