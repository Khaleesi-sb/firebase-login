import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  TextEditingController textEditingController;
  bool obscureText;
  String hintText;
  PasswordTextFieldWidget(this.textEditingController, this.obscureText, this.hintText, {Key? key}) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: widget.obscureText,
        controller: widget.textEditingController,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(
                20.0, 15.0, 20.0, 15.0),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 20, color: Colors.black54),
            suffixIcon: IconButton(
                icon: widget.obscureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                color: Colors.black,
                onPressed: () {setState(() {
                  widget.obscureText = !widget.obscureText;
                });}),
            focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(15.0))
        ),
      ),
    );
  }
}
