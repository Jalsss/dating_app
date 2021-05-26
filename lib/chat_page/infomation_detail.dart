import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_tags/flutter_tags.dart';

class InformationDetail extends StatefulWidget {
  int id;

  InformationDetail({Key key, this.id}) : super(key: key);

  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  List _items = [
    new Item(index: 1, title: 'Đá bóng', active: false, customData: null),
    new Item(index: 2, title: 'Nghe nhạc', active: false, customData: null),
    new Item(index: 3, title: 'Tiểu thuyết', active: false, customData: null)
  ];
  List<String> asset = [
    'assets/images/girls/img_1.jpeg',
    'assets/images/girls/img_2.jpeg',
    'assets/images/girls/img_3.jpeg',
    'assets/images/girls/img_4.jpeg',
    'assets/images/girls/img_5.jpeg',
    'assets/images/girls/img_6.jpeg'
  ];
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent, body: getBody());
  }

  Widget getBar() {
    return AppBar(
      leading: BackButton(color: Colors.white),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Widget getBody() {
    return SafeArea(
        child: Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/girls/img_2.jpeg'),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rondeau ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '18',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Ionicons.md_woman,
                          color: Colors.white70,
                          size: 25,
                        ),
                        Text(
                          ' Woman',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          EvilIcons.location,
                          color: Colors.white70,
                          size: 25,
                        ),
                        Text(
                          ' 40 meters away',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'It is a hot information for you - a guys',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  passion(),
                  music(),
                  photos(),

                ],
              ),
            )
          ]))
        ]),
      ],
    ));
  }

  Widget passion() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            color: Colors.white24,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            'Passion',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Tags(
            key: _tagStateKey,
            itemCount: _items.length, // required
            itemBuilder: (int index) {
              final item = _items[index];

              return Padding(
                padding: EdgeInsets.only(right: 2),
                child: ItemTags(
                  key: Key(index.toString()),
                  index: index,
                  // required
                  title: item.title,
                  active: item.active,
                  textStyle: TextStyle(
                    fontSize: 15,
                  ),
                  combine: ItemTagsCombine.withTextBefore,
                  border: Border.all(
                      width: 1,
                      color: item.active ? Colors.red : Colors.white70),
                  activeColor: Colors.black54,
                  color: Colors.transparent,
                  textActiveColor: Colors.white70,
                  textColor: Colors.white70,

                  onPressed: (item) {},
                  onLongPressed: (item) => print(item),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget music() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            color: Colors.white24,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            'Passion',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
    );
  }

  Widget photos() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            color: Colors.white24,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            'Photos',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
              asset.length,
              (index) {
                return Container(

                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02, top:  MediaQuery.of(context).size.width * 0.02),
                  width: MediaQuery.of(context).size.width * 0.295,
                    height: MediaQuery.of(context).size.width * 0.295,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Image.asset(
                          asset[index],
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ))
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
