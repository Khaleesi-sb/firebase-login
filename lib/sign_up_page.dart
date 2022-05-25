import 'package:firebase_project/log_in_page.dart';
import 'package:firebase_project/password_text_field_widget.dart';
import 'package:firebase_project/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _name  = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  var hidePassword = true;
  var hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xff005082),
                          fontSize: 30
                      ),
                    ),
                    Text("")
                  ],
                )
              ),
              TextFieldWidget(
                _name,
                "Full Name",
                "Full Name",
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                _email,
                "Email",
                "Email",
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                _phoneNo,
                "Phone No",
                "Phone No.",
              ),
              const SizedBox(
                height: 15,
              ),
              PasswordTextFieldWidget(
                _password,
                  hidePassword,
                "Password"
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordTextFieldWidget(
                  _confirmPassword,
                  hideConfirmPassword,
                  "Confirm Password"
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25),
                child: Container(
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffFF6525),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        // TODO: functionality
                      },
                      child: const Text("Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: FlatButton(
                  textColor: Colors.black,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: ('Already have an account? '),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: ('Log In'),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:  Colors.blueAccent)),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const LogInPage()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
