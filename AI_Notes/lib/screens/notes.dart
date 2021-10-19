import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:summary/screens/loading.dart';
import 'package:summary/screens/summarypage.dart';
//import 'package:characters/characters.dart';

class Inputpage extends StatefulWidget {
  @override
  _NotesState createState() => _InputpageState();
}

class _NotesState extends State<Notes> {
   String textValue = "";
   String output = "";
  TextEditingController _controller = TextEditingController();
  //var authc = FirebaseAuth.instance;

  var color;
  var res;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  getSummary(value) async {
    //final localhost =
    var url = "http://10.0.2.2:8000/summary";
    //var test = "http://10.0.2.2:8000/";

    try {
      //var response = await http.post(url);
      Loading.showLoadingDialog(context, _keyLoader);
      Map data = {'detail': value};
      String body = json.encode(data);
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: body,
      );
      _controller.clear();
      Navigator.of(context, rootNavigator: true).pop();
      print(response.statusCode);
      if (response.statusCode == 200) {
        final String res = response.body;
        final Map parsed = json.decode(res);
        setState(() {
          output = parsed['summary_text'];
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SummaryPage( summary: output),
            ));
      } else {
        print(response.statusCode);
      }
    } on Error catch (e) {
      print('Error: $e');
    }

    //return res;
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main"), // style TextStyle(color: Colors.yellow),),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  print("sign off");
                  //await authc.signOut();
                  Navigator.pushNamed(context, "artcle");
                }),
          ],
        ),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Container(
                color: Colors.amber,
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  minLines: 7,
                  textDirection: TextDirection.ltr,
                  onChanged: (value) {
                    textValue = value.trim();
                  },
                  
                  // cursorHeight: 15,
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type or Copy the Text Here",
                    focusColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Submit ",
                  style: TextStyle(
                    color: Colors.white,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  //   getLinuxOutput(command);
                  // ignore: unnecessary_statements
                  textValue.length == 0 ? () {} : getSummary(textValue);

                  print("Request Sent!");
                },
              ),
            ])));
  }
}
