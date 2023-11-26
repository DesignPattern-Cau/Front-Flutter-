import 'package:flutter/material.dart';
import 'package:flutter_web/search.dart';
import 'package:flutter_web/user.dart';

import 'model/book.dart';
import 'system/bookfunc.dart';

final back_uri = 'http://10.0.2.2:5000/'; //통신 uri

void main() {
  runApp(const MyApp());
}

String bookname = "";
String type = "작가";
List<Book> booklist = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final _MenuType = ["제목", "작가"];
  String _dropdownValue = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      _dropdownValue = _MenuType[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "중앙도서관",
              style: TextStyle(fontSize: 48),
            ),
            Expanded(
              child: SizedBox(
                width: 100.0,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // 페이지 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInfo()),
                  );
                },
                child: Icon(Icons.person)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2014/10/14/20/14/library-488690_1280.jpg",
                width: 600,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 64,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), //모서리를 둥글게
                          border: Border.all(
                              color: Colors.black12, width: 3)), //테두리),
                      child: DropdownButton(
                        underline: SizedBox.shrink(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 30,
                        value: _dropdownValue,
                        items: _MenuType.map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value as String),
                            )).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _dropdownValue = newValue!;
                          });
                        },
                        elevation: 4,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        //            onSubmitted: (text) {},
                        onChanged: (text) {
                          setState(() {
                            bookname = text;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          //
                          // booklist=await makeBookList(bookname,type);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()),
                          );
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
