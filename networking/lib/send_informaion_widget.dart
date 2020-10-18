import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking/http_service.dart';

class SendInformationWidget extends StatefulWidget {
  @override
  _SendInformationWidgetState createState() => _SendInformationWidgetState();
}

class _SendInformationWidgetState extends State<SendInformationWidget> {
  HttpService _httpService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Press me!',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('I do nothing at the moment'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    _httpService = HttpService(baseUri: '<backend_address_goes_here>');
    super.initState();
  }
}
