
import 'package:flutter/widgets.dart';
import 'package:native_feature_app/models/place.dart';

class PlacesProvider with ChangeNotifier{
  //varibles=====================================================
  List<Place> _items=[];

  //getters======================================================
  List<Place> get items{
    return [..._items];
  }

}