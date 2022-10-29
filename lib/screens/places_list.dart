import 'package:flutter/material.dart';
import 'package:native_feature_app/screens/add_places.dart';

class PlacesList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(Add_Place_Screen.routeName);
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}