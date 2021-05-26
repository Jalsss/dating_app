import 'dart:io';

import 'package:dating/introduce/connect_to_chat.dart';
import 'package:dating/pages/root_app.dart';
import 'package:dating/picker/picker_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:media_picker_builder/data/media_file.dart';
import 'package:media_picker_builder/media_picker_builder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class GetImage extends StatefulWidget {
  const GetImage({Key key}) : super(key: key);

  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  List<VideoPlayerController> _controller = List<VideoPlayerController>();

  VideoPlayerController _cameraVideoPlayerController;
  String _error;
  List<MediaFile> list = List<MediaFile>();
  bool err = false;
  int indexVideo = 0-1;

  _buildPicker() {
    showModalBottomSheet<Set<MediaFile>>(
      context: context,
      builder: (BuildContext context) {
        return PickerWidget(
          withImages: true,
          withVideos: true,
          onDone: (Set<MediaFile> selectedFiles) {
            selectedFiles.forEach((element) async {
              if (element.type == MediaType.VIDEO) {
                if (element.duration <= 15000) {
                  File _cameraVideo ;
                  _cameraVideo = File(element.path);
                  _cameraVideoPlayerController =
                      VideoPlayerController.file(_cameraVideo)
                        ..initialize().then((value) {
                          _cameraVideoPlayerController.addListener(() {                       //custom Listner
                            setState(() {
                              if (!_cameraVideoPlayerController.value.isPlaying &&_cameraVideoPlayerController.value.isInitialized &&
                                  (_cameraVideoPlayerController.value.duration ==_cameraVideoPlayerController.value.position)) { //checking the duration and position every time
                                //Video Completed//
                                setState(() {

                                });
                              }
                            });
                          });
                        });
                  _controller.add(_cameraVideoPlayerController);
                } else {
                  Navigator.pop(context);
                  setState(() {
                    err = true;
                  });
                  await Future.delayed(Duration(milliseconds: 100));
                  return showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          title: Text('Thông báo'),
                          content: Text(
                              'Vui lòng chọn video có thời gian nhỏ hơn 15s'),
                        );
                      });
                }
              }
            });
            if (!err) {
              setState(() {
                list.addAll(selectedFiles.toList());
              });
              Navigator.pop(context);
            }
          },
          onCancel: () {
            print("Cancelled");
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<bool> _checkPermission() async {
    final permissionStorageGroup =
        Platform.isIOS ? PermissionGroup.photos : PermissionGroup.storage;
    Map<PermissionGroup, PermissionStatus> res =
        await PermissionHandler().requestPermissions([
      permissionStorageGroup,
    ]);
    return res[permissionStorageGroup] == PermissionStatus.granted;
  }

  deleteAsset(MediaFile asset) {
    setState(() {
      list.remove(asset);
    });
  }

  // _buildPicker() {
  //   showModalBottomSheet<Set<MediaFile>>(
  //     context: navigatorKey.currentState.overlay.context,
  //     builder: (BuildContext context) {
  //       return PickerWidget(
  //         withImages: true,
  //         withVideos: true,
  //         onDone: (Set<MediaFile> selectedFiles) {
  //           print(selectedFiles);
  //           Navigator.pop(context);
  //         },
  //         onCancel: () {
  //           print("Cancelled");
  //           Navigator.pop(context);
  //         },
  //       );
  //     },
  //   );
  // }
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
            body: getBody(context),
            floatingActionButton: TextButton(
                child: Icon(
                  AntDesign.arrowright,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    shadowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent)),
                onPressed: () => Navigator.push(context,
    MaterialPageRoute(builder: (context) => ConnectToChat()),
                ))));
  }

  Widget getBar() {
    return AppBar(
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Widget getBody(BuildContext context) {
    setState(() {
      indexVideo = -1;
    });
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.center,
                children: List.generate(list.length + 1, (index) {
                  if(index != list.length) {
                    if(list[index].type == MediaType.VIDEO) {
                      setState(() {
                        indexVideo +=1;
                      });
                    }
                  }
                  return index == list.length
                      ? (index != 15
                          ? Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.32,
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.01,
                                  15,
                                  MediaQuery.of(context).size.width * 0.01,
                                  0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: [6, 3],
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: getPlus(context),
                                ),
                              ))
                          : Container())
                      : Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.32,
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.01,
                              15,
                              MediaQuery.of(context).size.width * 0.01,
                              0),
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: [6, 3],
                              radius: Radius.circular(12),
                              padding: EdgeInsets.all(6),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: list[index].type == MediaType.IMAGE
                                      ? image(context, list[index])
                                      : getVideo(context, list[index], indexVideo)
                              )));
                }))));
  }

  Widget getPlus(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextButton(
          child: Center(
              child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [6, 3],
            radius: Radius.circular(20),
            padding: EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                height: 20,
                width: 20,
                child: Center(
                  child: Icon(
                    AntDesign.plus,
                    size: 20,
                  ),
                ),
              ),
            ),
          )),
          onPressed: () {
            _checkPermission().then((granted) {
              if (!granted) return;

              _buildPicker();
            });
          },
        ));
  }

  Widget image(BuildContext context, MediaFile image) {
    return Container(
        height: 500,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Container(
              height: 200,
              child: Image.asset(
                image.path,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
                width: 25,
                height: 20,
                child: TextButton(
                  child: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    deleteAsset(image);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.fromLTRB(0, 0, 0, 0)),
                      shadowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                ))
          ],
        ));
  }

  Widget getVideo(BuildContext context, MediaFile mediaFile, int index) {
    return Container(
        height: 500,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Container(
                height: 500,
                width: MediaQuery.of(context).size.width * 0.3,
                child: AspectRatio(
                  aspectRatio: _controller[index].value.aspectRatio,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      VideoPlayer(_controller[index]),
                      SizedBox(
                          width: 25,
                          height: 20,
                          child: TextButton(
                            child: _controller[index].value.isPlaying ? Icon(Icons.pause, color: Colors.white) : Icon(Icons.play_arrow, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                if (_controller[index].value.isPlaying) {
                                  _controller[index].pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller[index].play();
                                  _controller[index].setLooping(true);
                                }
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.transparent),
                                padding: MaterialStateProperty.resolveWith(
                                        (states) => EdgeInsets.fromLTRB(0, 0, 0, 0)),
                                shadowColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.transparent),
                                overlayColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.transparent)),
                          ))
                    ],
                  )
                )),
            SizedBox(
                width: 25,
                height: 20,
                child: TextButton(
                  child: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    deleteAsset(mediaFile);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.fromLTRB(0, 0, 0, 0)),
                      shadowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                ))
          ],
        ));
  }
}
