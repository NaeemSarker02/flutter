import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'home_screen.dart';

class RecognizePage extends StatefulWidget {
  final String? path;
  const RecognizePage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("recognized page")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          maxLines: MediaQuery.of(context).size.height.toInt(),
          controller: controller,
          decoration: const InputDecoration(hintText: "Text goes here..."),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              // ignore: prefer_const_constructors
              MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: const Icon(
          Icons.keyboard_arrow_right,
          size: 40,
        ),
      ),
    );
  }

  void processImage(InputImage image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {});

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    controller.text = recognizedText.text;

    ///End busy state
    setState(() {});
  }
}
