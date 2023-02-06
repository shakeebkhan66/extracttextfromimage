import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognitionPage extends StatefulWidget {
  String? path;
  TextRecognitionPage({Key? key, this.path}) : super(key: key);

  @override
  State<TextRecognitionPage> createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {

  bool isBusy = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    InputImage? inputImage = InputImage.fromFilePath(widget.path!);
    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        automaticallyImplyLeading: false,
        title: const Text("Text Recognized", style: TextStyle(color: Colors.black),),
      ),
      body: isBusy == true ? const Center(
        child: CircularProgressIndicator(),
      ) : Container(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          controller: controller,
          maxLines: MediaQuery.of(context).size.height.toInt(),
          decoration: const InputDecoration(
            hintText: "Text goes here...."
          ),
        ),
      )
    );
  }

  // TODO Process Image Function
processImage(InputImage image) async{
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    setState(() {
      isBusy = true;
    });
    log(image.toString());
  final RecognizedText recognizedText = await textRecognizer.processImage(image);
  controller.text = recognizedText.text;

    // End Busy State-
  setState(() {
    isBusy = false;
  });
}
}
