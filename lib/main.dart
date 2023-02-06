import 'dart:developer';
import 'package:extracttextimage/Screens/text_recognition_page.dart';
import 'package:extracttextimage/Utils/image_picker_class.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Utils/image_cropper_page.dart';
import 'Widgets/modal_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Extract Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: const Text("Extract Text from Image", style: TextStyle(color: Colors.black),),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          imagePickerModal(context, onCameraTap: () {
            log("Camera");
            pickImage(source: ImageSource.camera).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TextRecognitionPage(
                                  path: value,
                                )));
                  }
                });
              }
            });
          }, onGalleryTap: () {
            log("Gallery");
            pickImage(source: ImageSource.gallery).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TextRecognitionPage(
                                  path: value,
                                )));
                  }
                });
              }
            });
          });
        },
        backgroundColor: Colors.green.shade200,
        tooltip: 'Increment',
        label: const Text(
          'Scan photo',
          style: TextStyle(color: Colors.black),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
