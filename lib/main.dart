import 'package:dating/login/login.dart';
import 'package:dating/pages/root_app.dart';
import 'package:dating/storage/local_storage.dart';
import 'package:flutter/material.dart';

final _storage = new LocalStorage();

void main() {
  check().then((intenet) async {
    if (intenet != null && intenet) {
      var isLogin = await _storage.readValue('isLogin');
      if (isLogin == 'true') {
        runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RootPage(),
        ));
      } else {
        runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Login(),
        ));
      }
    } else {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ));
    }
  });
  }