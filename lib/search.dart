// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:omdb_app/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var movies = List<Movie>();
  bool isLoading = false;

  // _getMovies(moviesSearched) {
  //   API.getMovies(moviesSearched).then((response) {
  //     setState(() {
  //       Iterable list = json.decode(response.body);
  //       movies = list.map((model) => Movie.fromJson(model)).toList();
  //     });
  //   });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getMovies("");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _searchBar(),
              Expanded(
                flex: 1,
                child: _mainData(),
              )
            ],
          ),
        ));
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search The Film Here...",
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (text) {},
        textInputAction: TextInputAction.search,
        onSubmitted: (text) {
          print("Searched by: '$text'");
          _fetchMovies(text);
        },
      ),
    );
  }

  _fetchMovies(String text) async {
    setState(() {
      isLoading = true;
    });
    List<Movie> tempList = List<Movie>();
    final response =
        await http.get("http://www.omdbapi.com/?apikey=f25681dd&s=$text");
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> data = jsonResponse["Search"];
      data.forEach((filme) {
        print(filme);
        filme = Movie.fromJson(filme);
        tempList.add(filme);
      });
    } else {
      throw Exception("Failed to fetch results for $text.");
    }
    setState(() {
      movies = tempList;
      isLoading = false;
    });
  }

  Widget _mainData() {
    return
      Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(movies[index].title),
                    subtitle:
                        Text("${movies[index].year}"),
                    trailing: Image.network(movies[index].poster),
                    dense: false,
                    isThreeLine: false,
                    // Icon(Icons.movie),
                  ));
                }));
  }
}
