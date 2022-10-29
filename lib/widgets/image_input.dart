import 'package:flutter/material.dart';
import 'dart:io';
class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;

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
          ? Text('Capture Image',textAlign: TextAlign.center,)
          : Image.file(
            storedImage!, 
            fit: BoxFit.cover,
            width: double.infinity,
            ),
        ),
        TextButton.icon(
          onPressed: (){
        }, 
        icon: Icon(Icons.camera), label: Text('Take Image'))
      ],
    );
  }
}