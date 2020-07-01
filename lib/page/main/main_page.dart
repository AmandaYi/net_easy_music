import 'package:flutter/material.dart';
import 'package:net_easy_music/components/blurBackground.dart';
import 'package:provider/provider.dart';
import 'package:net_easy_music/model/drawer_manage.dart';
import 'audioControl.dart';
import 'my_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String url =
      'http://p1.music.126.net/f3epEXZbd8O3IcFYWAA7GA==/109951165073323532.jpg?param=1440y1440';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Provider.of<DrawerManage>(context).isOpen
                    ? Colors.transparent
                    : Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  _onDrawerOpenOrClose(state) {
    if (state) {
      Future.delayed(Duration(seconds: 0), () {
        Provider.of<DrawerManage>(context, listen: false).openDrawer();
      });
    } else {
      Future.delayed(Duration(seconds: 0), () {
        Provider.of<DrawerManage>(context, listen: false).closeDrawer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(callback: _onDrawerOpenOrClose),
      body: SafeArea(
        child: new Stack(
          children: <Widget>[
            BlurBackground(
              imageUrl: url,
            ),
            Column(
              children: <Widget>[
                _buildTopBar(context),
                Expanded(child: Container()),
                AudioControl()
              ],
            ),
            // AudioControl()
          ],
        ),
      ),
    );
  }
}
