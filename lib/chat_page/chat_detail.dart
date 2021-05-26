import 'package:dating/model/list_friend_model.dart';
import 'package:dating/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'app_bar_network_rounded_image.dart';
import 'infomation_detail.dart';
import 'messenger_app_bar.dart';



class ChatDetail extends StatefulWidget {
  ListFriendModel friendItem;
  ChatDetail({Key key, this.friendItem}) : super(key: key);

  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  List<Message> messages = [

    Message(
      id: 11,
      createdAt: "2019-10-07T13:50:11.633Z",
      content:
      "nice to meet you",
      isYou: true,
    ),
    Message(
      id: 11,
      createdAt: "2019-10-07T13:50:11.633Z",
      content:
      "hi",
      isYou: false,
    ),
    Message(
      id: 11,
      createdAt: "2019-10-07T13:50:11.633Z",
      content:
      "hello",
      isYou: true,
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final _isScroll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  if (index != messages.length - 1 && !messages[index].isYou) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AppBarNetworkRoundedImage(
                              imageUrl: widget.friendItem.imageAvatarUrl),
                          SizedBox(width: 15.0),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              messages[index].content,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return !messages[index].isYou ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 55.0),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              messages[index].content,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          )
                        ],
                      ),
                    ) : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(width: 55.0),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              messages[index].content,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
                itemCount: messages.length,
              ),
            ),
            _buildBottomChat(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return MessengerAppBarAction(
      isScroll: _isScroll,
      isBack: true,
      title: widget.friendItem.name,
      imageUrl: widget.friendItem.imageAvatarUrl,
      subTitle: 'Active 10 hours ago',
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InformationDetail(id : 5))), child: Icon(
          MaterialIcons.info,
          color: Colors.lightBlue,
          size: 25.0,
        )),
      ],
    );
  }

  _buildBottomChat() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(
                FontAwesome.image,
                size: 25.0,
                color: Colors.lightBlue,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Aa',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                    suffixIcon: Icon(
                      FontAwesome.smile_o,
                      size: 25.0,
                      color: Colors.lightBlue,
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesome.send,
                size: 25.0,
                color: Colors.lightBlue,
              ),
            ),
          )
        ],
      ),
    );
  }
}