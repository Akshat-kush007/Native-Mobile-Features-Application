import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_feature_app/providers/places_provider.dart';
import 'package:native_feature_app/widgets/image_input.dart';
import 'package:provider/provider.dart';

import '../widgets/location_input.dart';

class Add_Place_Screen extends StatefulWidget {
  static const routeName='/add_place_screen';
  @override
  State<Add_Place_Screen> createState() => _Add_Place_ScreenState();
}

class _Add_Place_ScreenState extends State<Add_Place_Screen> {
  //variblers==============================================================
  final titleControler=TextEditingController();
  String? title;
  File? _pickedImage;

  //Methods================================================================
  void _setPickedImage(File pickedImage){
    print('seting image');
    _pickedImage=pickedImage;
  }
  
  void _savePlace(){
    if(titleControler.text.isEmpty || _pickedImage==null){
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Add Title :${titleControler.text} and Image : ${_pickedImage==null}!'))
      );
      return;
    }
    Provider.of<PlacesProvider>(context,listen: false).addPlaces(titleControler.text, _pickedImage!, null);
    Navigator.of(context).pop();
  }

  //widget tree============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Place'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: titleControler,
                        decoration: const InputDecoration(
                          label: Text('Title')
                        ),
                      ),
                    ),
                    ImageInput(_setPickedImage),
                    SizedBox(height: 10,),
                    LocationInput(),
                  ],
                ),
              ),
            ) 
          ),
          ElevatedButton.icon(
            onPressed: _savePlace, 
            icon: const Icon(Icons.add), 
            label: const Text('Add Place'),
            
            style: ElevatedButton.styleFrom(
              onPrimary: Theme.of(context).accentColor,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
            ),
            ),
        ],
        ),
    );
  }
}