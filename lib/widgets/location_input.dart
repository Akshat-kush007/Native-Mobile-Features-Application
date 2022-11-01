import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';

class LocationInput extends StatelessWidget {
  // Varibles=============================================================
  String? _previewImage;

  // Methods==============================================================
  Future<void> _getLocaion() async{
    final locationData= await Location().getLocation();
    print(locationData.longitude);
    print(locationData.latitude);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Center(
            child: _previewImage==null 
            ? const Text('Select location Option')
            : Image.network(_previewImage!,fit: BoxFit.cover,width: double.infinity,),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: _getLocaion,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select location'),
            )
          ],
        )
      ],
    );
  }
}
