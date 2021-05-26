import 'package:dating/introduce/get_date_of_birth.dart';
import 'package:dating/pages/root_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ConnectToChat extends StatefulWidget {
  const ConnectToChat({Key key}) : super(key: key);

  @override
  _ConnectToChatState createState() => _ConnectToChatState();
}

class _ConnectToChatState extends State<ConnectToChat>
    with TickerProviderStateMixin {
  double smallLogo = 100;
  double bigLogo = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: getBar(),
            body: getBody(),
            ));
  }

  Widget getBar() {
    return AppBar(
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Widget getBody() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Bạn có muốn nhận tin nhắn từ người lạ hay ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Người lạ có thể nhắn tin cho bạn sau khi yêu thích bạn'),


            ],
          ),
          Container(
            width: MediaQuery
              .of(context)
              .size
              .width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                button(
                    'CHẤP NHẬN',
                        () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RootPage()), (Route<dynamic> route) => false);
                        }),
                Padding(padding: EdgeInsets.only(top: 15),),
                button(
                    'BỎ QUA',
                        () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RootPage()), (Route<dynamic> route) => false);
                    }),

                Padding(padding: EdgeInsets.only(top: 25),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget button(String text, Function() onclick,
      ) {
    return Container(
        height: 60,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black54.withOpacity(0.85),
        ),
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateColor
                  .resolveWith((states) =>
              Colors.transparent),
              padding: MaterialStateProperty.resolveWith((states) =>
                  EdgeInsets.fromLTRB(0, 0, 0, 0)),
              shadowColor: MaterialStateColor.resolveWith((states) =>
              Colors.transparent),
              overlayColor: MaterialStateColor.resolveWith((states) =>
              Colors.transparent)
          ),
          child:
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white38),
              ),
          onPressed: onclick,
        )
    );
  }

}
