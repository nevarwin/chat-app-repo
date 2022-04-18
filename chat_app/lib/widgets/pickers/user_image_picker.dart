import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  late File _imageFile;
  final picker = ImagePicker();

  void pickImage() async {
    final pickedImageFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    ) as File;
    setState(() {
      _imageFile = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _imageFile != null ? FileImage(_imageFile) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
