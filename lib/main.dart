import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Input to Display',
      home: InputField(),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({Key key}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

final myController = TextEditingController();

class _InputFieldState extends State<InputField> {
  String text1 = myController.text;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input to Display'),
      ),
      body: Container(
        child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
              controller: myController,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.text_fields_rounded),
        onPressed: checkIfInputFieldIsEmptyOrNot,
      ),
    );
  }

  void checkIfInputFieldIsEmptyOrNot() {
    text1 == myController.text
        ? showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Input Field is Empty'),
          );
        })
        : showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(myController.text),
          );
        });
  }
}
