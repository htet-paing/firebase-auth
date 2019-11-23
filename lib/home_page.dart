import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: <Widget>[
          Builder(builder: (BuildContext context){
            return FlatButton(
              child: Text("Sign out"),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async{
                final FirebaseUser user = await _auth.currentUser();
                if(user == null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("No one has sign in!"))
                  );
                  return;
                }
                _signout();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(uid + 'has successfully sign out'),)
                );
              },
            );
          })
        ],
      ),
      body: Center(
        child: Text("Welcome from firebase auth"),
      )
    );


  }

  void _signout() async{
    await _auth.signOut();
  }
}
