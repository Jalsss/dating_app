import 'package:dating/login/login.dart';
import 'package:dating/pages/root_app.dart';
import 'package:dating/storage/local_storage.dart';
import 'package:flutter/material.dart';

final _storage = new LocalStorage();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  check().then((intenet) async {
    if (intenet != null && intenet) {
      var isLogin = await _storage.readValue('isLogin');
      if (isLogin == 'true') {
        runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.teal[200], // All text is black
              primaryTextTheme: Typography().black,  // ALL text is white

            ),
          home: RootPage(),
        ));
      } else {
        runApp(MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.teal[200], // All text is black
            primaryTextTheme: Typography().black,  // ALL text is white

          ),
          debugShowCheckedModeBanner: false,
          home: Login(),
        ));
      }
    } else {
      runApp(MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal[200], // All text is black
          primaryTextTheme: Typography().black,  // ALL text is white

        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ));
    }
  });
  }