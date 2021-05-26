import 'package:dating/introduce/get_date_of_birth.dart';
import 'package:dating/pages/root_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GetName extends StatefulWidget {
  const GetName({Key key}) : super(key: key);

  @override
  _GetNameState createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {

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
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: getBar(),
        body: getBody(),
        floatingActionButton: TextButton(
          child:  Icon(
            AntDesign.arrowright,
            color: Colors.black,
          ),
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
          onPressed:
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => GetDateOfBirth())),
        )
      )
    );
  }
  Widget getBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Widget getBody() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bạn tên gì?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              alignLabelWithHint: false,
              hintText: 'Enter your username....',
              focusedBorder:UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.black87, width: 1.0)
            ),
            ),
            cursorColor: Colors.black87,

          ),
        ],
      ),
    );
  }
}
