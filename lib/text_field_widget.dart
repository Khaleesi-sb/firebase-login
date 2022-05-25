import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController textEditingController;
  String hintText;
  String labelText;
  TextFieldWidget(this.textEditingController, this.hintText, this.labelText, {Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: widget.textEditingController,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a username';
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(
                20.0, 15.0, 20.0, 15.0),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.black54),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black54),
            focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(15.0)
            )
        ),
      ),
    );
  }
}
