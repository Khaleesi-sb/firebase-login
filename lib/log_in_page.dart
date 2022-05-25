import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/google_sign_in_provider.dart';
import 'package:firebase_project/home_page.dart';
import 'package:firebase_project/password_text_field_widget.dart';
import 'package:firebase_project/sign_up_page.dart';
import 'package:firebase_project/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  var hidePassword = true;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future<UserCredential> signInFacebook() async{
    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ["email"]);
    if(loginResult == LoginStatus.success){
      final user = await FacebookAuth.instance.getUserData();
      Map<String, dynamic>? _user = user;
    } else{
      print(loginResult.message);
    }
    final OAuthCredential oAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  }

  static Future<User?> loginWithEmailPassword({
    required String email, 
    required String password, 
    required BuildContext context
  }) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("no user found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Log In Page"),
      // ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 30
                              ),
                            ),
                            Text("")
                          ],
                        )
                    ),
                    TextFieldWidget(_email, "Email", "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordTextFieldWidget(
                        _password,
                        hidePassword,
                        "Password"
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
                            onPressed: () async {
                              User? user = await loginWithEmailPassword(email: _email.text, password: _password.text, context: context);
                              print(user);
                              // if(user != null){
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const HomePage()),
                              //   );
                              // }
                            },
                            child: const Text("Log In",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, top: 20, bottom: 20),
                          child: Divider(
                            color: Colors.black54,
                            thickness: 4,
                          ),
                        ),
                        Text("Or,"),
                        Padding(
                          padding: EdgeInsets.only(right: 25.0, top: 20, bottom: 20),
                          child: Divider(
                            color: Colors.black54,
                            thickness: 4,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            provider.googleLogIn();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.google, color: Color(0xffFF6525),),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, color: Color(0xff005082)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25),
                      child: Container(
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () {
                              // TODO: functionality
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                FaIcon(FontAwesomeIcons.facebook, color: Colors.blueAccent,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Facebook",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20, color: Color(0xff005082)))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: FlatButton(
                        textColor: Colors.black,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: ('Don\'t have an account? '),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ('Register'),
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
                                const SignUpPage()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}