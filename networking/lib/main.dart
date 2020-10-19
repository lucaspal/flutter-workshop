import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter workshop'),
      ),
      body: SendInformationWidget(),
    );
  }
}

class SendInformationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            color: Colors.lightBlue,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image.asset(
                'assets/logo.png',
                height: 60,
              ),
              title: Text('Greetings'),
              subtitle: Text('nothing yet'),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Pressed!')));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                elevation: 20,
                color: Colors.lightBlue[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Get greetings pressed!'),
                    ),
                  );
                },
                child: Text(
                  'Get greetings',
                ),
              ),
              RaisedButton(
                elevation: 20,
                color: Colors.lightBlue[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Reset pressed!'),
                    ),
                  );
                },
                child: Text(
                  'Reset',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
