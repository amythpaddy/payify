import 'package:flutter/material.dart';
import 'package:payify/storeprofil.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    initialRoute: '/',
    routes: {'/storeprofile': (context) => SecondScreen()},
  ));
}

class HomePage extends StatelessWidget {
  Container createTile(BuildContext context, String title, String description,
      [String openPage]) {
    return Container(
      width: 300,
      constraints: BoxConstraints(
        minHeight: 150,
      ),
      margin: EdgeInsets.all(5),
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/$openPage');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.menu,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      color: Colors.blue[50],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 300, maxWidth: 1000),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Control Centre',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: <Widget>[
                      createTile(context, 'Reports',
                          'Help customers find your business on Payify'),
                      createTile(context, 'User Management',
                          'Add, edit & delete users.'),
                      createTile(context, 'Notification',
                          'Manage when you received notifications'),
                      createTile(context, 'Store Categories',
                          'Help customer find your business on Payify'),
                      createTile(
                          context,
                          'Store Profile',
                          'Set your store profile, logo, description etc.',
                          'storeprofile'),
                      createTile(context, 'Account',
                          'Help customer find your business on Payify'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
