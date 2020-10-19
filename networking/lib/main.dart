import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:networking/http_service.dart';

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

class SendInformationWidget extends StatefulWidget {
  @override
  _SendInformationWidgetState createState() => _SendInformationWidgetState();
}

class _SendInformationWidgetState extends State<SendInformationWidget> {
  HttpService _httpService;
  String _greeting;
  String _name;
  String _firstField;
  String _secondField;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                title: Text('Insert your name'),
                subtitle: TextField(
                  onChanged: (newValue) {
                    setState(() {
                      _name = newValue;
                    });
                  },
                ),
              ),
            ),
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
                subtitle: Text(_greeting ?? 'No greeting :('),
              ),
            ),
            Card(
                elevation: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        onChanged: (newValue) {
                          setState(() {
                            _firstField = newValue.isNotEmpty ? newValue : null;
                          });
                        },
                      ),
                      TextField(
                        onChanged: (newValue) {
                          setState(() {
                            _secondField = newValue.isNotEmpty ? newValue : null;
                          });
                        },
                      )
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  elevation: 20,
                  color: Colors.lightBlue[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    final result = await _httpService.getHelloFromBackend(name: _name);
                    setState(() {
                      _greeting = result + '  🎉';
                    });
                  },
                  child: Text(
                    'Greet',
                  ),
                ),
                RaisedButton(
                  elevation: 20,
                  color: Colors.lightBlue[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    setState(() {
                      _greeting = null;
                    });
                  },
                  child: Text(
                    'Reset',
                  ),
                ),
                RaisedButton(
                  elevation: 20,
                  disabledColor: Colors.grey[300],
                  disabledElevation: 0,
                  color: Colors.lightBlue[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: (_firstField != null && _secondField != null) ? () async {
                    await _httpService.sendNewContent(_firstField, _secondField);
                  } : null,
                  child: Text(
                    'Send data',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // _httpService = HttpService(baseUri: '<expose with ngrok http 5000>');
    super.initState();
  }
}
