import 'package:dating/data/account_json.dart';
import 'package:dating/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.60,
        decoration: BoxDecoration(color: white, boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(account_json[0]['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                account_json[0]['name'] + ", " + account_json[0]['age'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 15,
                                // changes position of shadow
                              ),
                            ]),
                        child: Icon(
                          Icons.settings,
                          size: 35,
                          color: grey.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SETTINGS",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 15,
                                // changes position of shadow
                              ),
                            ]),
                        child: Icon(
                          Icons.edit,
                          size: 35,
                          color: grey.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "EDIT INFO",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
