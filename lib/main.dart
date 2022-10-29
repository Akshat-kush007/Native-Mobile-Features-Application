import 'package:flutter/material.dart';
import 'package:native_feature_app/providers/places_provider.dart';
import 'package:native_feature_app/screens/add_places.dart';
import 'package:native_feature_app/screens/places_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> PlacesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesList(),
        routes:{
          Add_Place_Screen.routeName: (context) => Add_Place_Screen(),
        } ,
      ),
    );
  }
}
