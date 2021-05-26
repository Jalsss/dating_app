// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dating/constant/constant.dart';
// import 'package:dating/constant/hexcolor.dart';
// import 'package:dating/notification/notification.config.dart';
import 'package:dating/constant/hexcolor.dart';
import 'package:dating/introduce/get_name.dart';
import 'package:dating/pages/root_app.dart';
import 'package:dating/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:http/http.dart';

// final _storage = new LocalStorage();

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
  }

  // final facebookLogin = FacebookLogin();

  login() async {
    // setState(() {
    //   isLoading = true;
    // });
    // final result = await facebookLogin.logIn(['email', 'public_profile']);
    // switch (result.status) {
    //   case FacebookLoginStatus.loggedIn:
    //     var graphResponse = await get(
    //         'https://graph.facebook.com/${result.accessToken.userId}?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}');
    //     if (graphResponse.statusCode == 200) {
    //       String appID = json.decode(graphResponse.body)["email"] != null
    //           ? json.decode(graphResponse.body)["email"]
    //           : json.decode(graphResponse.body)["id"];
    //       String appSystem = Platform.isAndroid ? "0" : "1";
    //       String data = "?mID=12&appID=" +
    //           appID +
    //           "&avatar=https://graph.facebook.com/" +
    //           result.accessToken.userId +
    //           "/picture?height=200" +
    //           "&hoVaTen=" +
    //           json.decode(graphResponse.body)["name"] +
    //           "&appSystem=" +
    //           appSystem;
    //
    //       final res = await get(
    //           Constant.apiAdress + '/api/mobile/fbAdd.asmx/fbAdd' + data);
    //       if (res.statusCode == 200) {
    //         String dataFcm = "?mID=12&appID=" +
    //             appID +
    //             "&token=" +
    //             json.decode(res.body)['data'] +
    //             "&appSystem=" +
    //             appSystem;
    //         await get(
    //             Constant.apiAdress + '/api/mobile/game.asmx/fcmAdd' + dataFcm);
    //         _storage.writeValue('isSignIn', 'true');
    //         _storage.writeValue('appID', appID);
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => GetName()));
    //       } else {
    //         return showDialog(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return MyDialog('Đã xảy ra lỗi, vui lòng thử lại sau');
    //           },
    //         );
    //       }
    //
    //       setState(() {
    //         isLoading = false;
    //       });
    //     }
    //     break;
    //   case FacebookLoginStatus.cancelledByUser:
    //     setState(() {
    //       isLoading = false;
    //     });
    //     return showDialog(
    //         context: context,
    //         builder: (builder) {
    //           return AlertDialog(
    //               title: Text('Thông báo'),
    //               content: Text('Đăng nhập thất bại'));
    //         });
    //
    //     break;
    //   case FacebookLoginStatus.error:
    //     setState(() {
    //       isLoading = false;
    //     });
    //     print(result.errorMessage);
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor.fromHex('#f85352'),
                HexColor.fromHex('#f7116c'),
              ],
            )),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                    child: Center(
                      child: Text(
                        'dating',
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ),
                  Container(
                    child: Column(
                      children: [
                        button(
                            'LOG IN WITH GOOGLE',
                            Icon(
                              Ionicons.logo_google,
                              color: Colors.white70,
                            ),
                                () {}),
                        Padding(padding: EdgeInsets.only(top: 15),),
                        button(
                            'LOG IN WITH FACEBOOK',
                            Icon(
                              FontAwesome5Brands.facebook,
                              color: Colors.blue,
                            ),
                                () {
                              login();
                                }),
                        Padding(padding: EdgeInsets.only(top: 15),),
                        button(
                            'LOG IN WITH PHONE NUMBER',
                            Icon(
                              FontAwesome.comment,
                              color: Colors.white70,
                            ),
                                () {}),

                        Padding(padding: EdgeInsets.only(top: 15),),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget button(String text, Widget icon, Function() onclick,
      ) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black54.withOpacity(0.85),
      ),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor
                .resolveWith((states) =>
            Colors.transparent),
            padding: MaterialStateProperty.resolveWith((
                states) => EdgeInsets.fromLTRB(0, 0, 0, 0)),
            shadowColor: MaterialStateColor.resolveWith((
                states) => Colors.transparent),
            overlayColor: MaterialStateColor.resolveWith((
                states) => Colors.transparent)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: icon,
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white38),
            ),
            Container()
          ],
        ),
        onPressed: onclick,
      )
    );
  }
}
