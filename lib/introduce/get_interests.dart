import 'package:dating/introduce/get_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_tags/flutter_tags.dart';

class GetInterests extends StatefulWidget {
  const GetInterests({Key key}) : super(key: key);

  @override
  _GetInterestsState createState() => _GetInterestsState();
}

class _GetInterestsState extends State<GetInterests> {
  List _items = [new Item(index : 0,title : 'Đá Cầu',active: false, customData: null),
    new Item(index : 1,title : 'Đá bóng',active: false, customData: null),
    new Item(index : 2,title : 'Nghe nhạc',active: false, customData: null),
    new Item(index : 3,title : 'Tiểu thuyết',active: false, customData: null),
    new Item(index : 4,title : 'Nhạc Rap',active: false, customData: null),
    new Item(index : 5,title : 'Ngôn tình',active: false, customData: null),
    new Item(index : 6,title : 'Truyện cười',active: false, customData: null),
    new Item(index : 7,title : 'Khác',active: false, customData: null)];
  double _fontSize = 20;

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
// Allows you to get a list of all the ItemTags
  _getAllItem(){
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if(lst!=null)
      lst.where((a) => a.active==true).forEach( ( a) => print(a.title));
  }
  @override
  void initState(){
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
              onPressed:() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetImage())),
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
          Text('Sở thích của bạn là?',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
      Container(
        height: 20,
      ),
      Tags(
        key:_tagStateKey,
        itemCount: _items.length, // required
        itemBuilder: (int index){
          final item = _items[index];

          return ItemTags(
            // Each ItemTags must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(index.toString()),
            index: index, // required
            title: item.title,
            active: item.active,
            textStyle: TextStyle( fontSize: _fontSize, ),
            combine: ItemTagsCombine.withTextBefore,
            border: Border.all(width: 2,color: item.active ? Colors.red : Colors.black87),
            activeColor: Colors.black54,
            color: Colors.transparent,
            textActiveColor: Colors.white70,
            textColor: Colors.white70,
            onPressed: (item){
              setState(() {
                _items[index] = item;
              });
            },
            onLongPressed: (item) => print(item),
          );

        },
      )
        ],
      ),
    );
  }

}
