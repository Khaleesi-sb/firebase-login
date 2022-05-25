import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/log_in_page.dart';
import 'package:firebase_project/logged_in_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData){
            return const LoggedInPage();
          }
          else if(snapshot.hasError){
            return const Center(child: Text("Error"),);
          } else{
            return const LogInPage();
          }
        },
      ),
    );
  }
}
