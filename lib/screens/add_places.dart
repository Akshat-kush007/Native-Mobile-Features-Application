import 'package:flutter/material.dart';
import 'package:native_feature_app/widgets/image_input.dart';

class Add_Place_Screen extends StatefulWidget {
  static const routeName='/add_place_screen';
  @override
  State<Add_Place_Screen> createState() => _Add_Place_ScreenState();
}

class _Add_Place_ScreenState extends State<Add_Place_Screen> {
  //variblers==============================================================
  final titleControler=TextEditingController();
  String? title;

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
                    ImageInput(),
                  ],
                ),
              ),
            ) 
          ),
          ElevatedButton.icon(
            onPressed: (){}, 
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