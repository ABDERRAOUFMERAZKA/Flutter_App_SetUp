
import 'package:flutter/material.dart'; //imported flutter material package

class HomePage extends StatefulWidget{ // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) { // creating the widget
    return new Scaffold(
        appBar: new AppBar( //defines the content of the Appbar
          title: new Text("Calculator"),
        ),
        body: Container(
          child: Column( //Since we have multiple children arranged vertically, we are using column
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal vertical space between all the children of column
            children: <Widget>[ // the column widget uses the children property
              Container( // Display Container
                constraints: BoxConstraints.expand( // Creating a boxed container
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
                ),
                alignment: Alignment.bottomRight, // Aligning the text to the bottom right of our display screen
                color: Colors.white, // Seting the background color of the container
                child: Text(
                  "0",
                  style: TextStyle( // Styling the text
                      fontSize: 50.0,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('C', style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                        )),
                      ), // using custom widget _button
                      RaisedButton(child: Text('X', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      ),
                      RaisedButton(child: Text('=', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      ),
                      RaisedButton(child: Text('/', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('C', style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                      ), // using custom widget _button
                      RaisedButton(child: Text('X', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      ),
                      RaisedButton(child: Text('=', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      ),
                      RaisedButton(child: Text('/', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}