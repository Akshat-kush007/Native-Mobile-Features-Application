// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'dart:io';
//add Packages----------------------------------
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as systemPath;

class ImageInput extends StatefulWidget {
  Function setPickedImage;
  ImageInput(this.setPickedImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  //Varibles=========================================================
  File? storedImage;

  //Methods==========================================================
  void _takeImage() async{
    final picker=ImagePicker();
    final imageInput= await picker.pickImage(source: ImageSource.camera,maxWidth:400 );
    if(imageInput==null){
      return;
    }
    setState(() {
      storedImage=File(imageInput.path);
    });

    final appDir=await systemPath.getApplicationDocumentsDirectory();
    final imageName=path.basename(imageInput.path);
    final savedImage=await storedImage!.copy('${appDir.path}/$imageName');
    // print('storedImage: $storedImage');
    // print('savedImage: $savedImage');
    widget.setPickedImage(savedImage);
  }
  
  //Widget tree======================================================
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1)),
          child: storedImage==null 
          ? const Text('Capture Image',textAlign: TextAlign.center,)
          : Image.file(
            storedImage!, 
            fit: BoxFit.cover,
            width: double.infinity,
            ),
        ),
        TextButton.icon(
          onPressed: _takeImage, 
        icon: const Icon(Icons.camera), label: const Text('Take Image'))
      ],
    );
  }
}