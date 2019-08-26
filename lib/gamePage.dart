import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  Future<void> changeOrientation() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    return await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight]);
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),

      ),
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Settings'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Change password'),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Sound'),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Sign out'),
              onTap: () {

              },
            ),
          ],
        ),
      ),

    );
  }
  @override
  void initState() {
    changeOrientation();
    super.initState();
  }
}
