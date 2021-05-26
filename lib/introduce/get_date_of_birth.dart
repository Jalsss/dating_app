import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'get_interests.dart';

class GetDateOfBirth extends StatefulWidget {
  const GetDateOfBirth({Key key}) : super(key: key);

  @override
  _GetDateOfBirthState createState() => _GetDateOfBirthState();
}

class _GetDateOfBirthState extends State<GetDateOfBirth> {
  static DateTime today = DateTime.now();
  DateTime firstDate = new DateTime.utc(1900, 1, 1);
  DateTime lastDate = new DateTime(today.year - 18, today.month, today.day);
  DateTime initialDate = new DateTime.utc(1999, 1, 1);
  final myController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
            containerHeight: 210.0, backgroundColor: Colors.white),
        showTitleActions: true,
        minTime: firstDate,
        maxTime: lastDate, onConfirm: (date) {
      print('confirm $date');
      String _date = '${date.day}/${date.month}/${date.year}';
      setState(() {
        myController.text = _date;
        initialDate = date;
      });
    }, currentTime: initialDate, locale: LocaleType.vi);
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
            floatingActionButton: TextButton(
                child: Icon(
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
                onPressed:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => GetInterests())),
                )));
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
        children: [
          Text(
            'Ngày sinh của bạn là?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {
                _selectDate(context);
              },
              child: TextField(
                controller: myController,
                enabled: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  alignLabelWithHint: false,
                  hintText: 'Enter your birth day....',
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black87, width: 1.0)),
                ),
                cursorColor: Colors.black87,
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
          )),
        ],
      ),
    );
  }
}
