import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image_picker demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'image_picker demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: imageFile == null
              ? Text('No image')
              : Image.file(imageFile)),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: Icon(Icons.image),
      ),
    );
  }

  void _pickImage() async {
      imageFile = await ImagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 500, maxHeight: 1000);
      print(imageFile.path);
      setState(() {});
  }
}

