import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:native_feature_app/helper/db_helper.dart';
import 'package:native_feature_app/models/place.dart';

class PlacesProvider with ChangeNotifier {
  //varibles=====================================================
  List<Place> _items = [];

  //getters======================================================
  List<Place> get items {
    return [..._items];
  }

  // Methods=====================================================
  void addPlaces(String title, File image, PlaceLocation? location) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: location,
      image: image,
    );
    _items.add(newPlace);
    notifyListeners();
    DBhelper.insert(
      'user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image_path': newPlace.image.path,
    });
  }

  Future fetchAndSetPlace() async{
    final dataList= await DBhelper.getData('user_places');
    _items=dataList.map((item){
      return Place(
        id: item['id'], 
        title: item['title'], 
        location: null, 
        image: File(item['image_path']));
    }).toList();
  }
}
