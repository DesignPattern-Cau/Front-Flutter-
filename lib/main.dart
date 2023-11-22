import 'package:flutter/material.dart';
import 'package:flutter_web/search.dart';
import 'package:flutter_web/user.dart';

void main() {
  runApp(const MyApp());
}

String bookname = "";

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "중앙문고",
              style: TextStyle(fontSize: 28),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Text(
                          "도서명",
                          style: TextStyle(fontSize: 28),
                        ),
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
                        onPressed: () {
                          // 페이지 이동
                          //                     setState(() {
                          //    inputText = inputController.text;
                          //   });
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
