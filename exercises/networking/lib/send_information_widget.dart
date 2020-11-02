import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendInformationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 40,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('Greetings from:'),
              RaisedButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Pressed!')));
                },
                child: Text(
                  'Get greetings',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
