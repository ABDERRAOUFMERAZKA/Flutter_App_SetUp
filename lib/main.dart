// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }
  final title = 'Traveling by';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(title),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Craft', icon: Icons.airplanemode_active),
];

class ChoiceCard extends StatefulWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  BodyWidget createState() => new BodyWidget();
}

class BodyWidget extends State<ChoiceCard> {
  String dep = '';
  String dest = '';

  BodyWidget({Key key, this.choice}) : super();
  final Choice choice;

  void _onChangeDep(String departure) {
    setState(() => dep = departure);
  }

  void _onChangeDest(String destination) {
    setState(() => dest = destination);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
                width: 250.0,
                child: new TextField(

                    decoration: new InputDecoration(
                        hintText: 'From...',
                        icon: new Icon(Icons.near_me)),
                    autofocus: true,
                    onChanged: _onChangeDep,
                )
            ),
            new Container(
                width: 250.0,
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'To...',
                      icon: new Icon(Icons.flag)),
                  onChanged: _onChangeDest,
                )
            ),
            new Container(
              margin: const EdgeInsets.only(top: 40),
              child: new Icon( Icons.airplanemode_active, size:60.0,color: Colors.lightGreen),
            ),
            Text(dep, style: textStyle),
            Text(dest, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(TravelApp());
}