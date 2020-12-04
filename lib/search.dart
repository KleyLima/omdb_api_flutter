import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> dogsBreedList = List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _searchBar()
              // Expanded(
              //   flex: 1,
                // child: _mainData(),
              // )
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
        onChanged: (text) {
        },
        textInputAction: TextInputAction.search,
        onSubmitted: (text) {
          print("Searched by: '$text'");
        },
      ),
    );
  }

}