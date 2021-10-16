import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SummaryPage extends StatefulWidget {
  final String summary;
  const SummaryPage({this.summary});

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  String summary;
  @override
  Widget build(BuildContext context) {
    // Here you direct access using widget
    summary = widget.summary;

    return Scaffold(
        appBar: AppBar(
          title: Text("Summary"), // style TextStyle(color: Colors.yellow),),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  print("sign off");
                  //await authc.signOut();
                  Navigator.pushNamed(context, "login");
                }),
          ],
        ),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blue, Colors.red],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                          margin: EdgeInsets.all(15),
                          shadowColor: Colors.lightBlue,
                          elevation: 8,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  summary,
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Summary',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ]))));
  }
}
