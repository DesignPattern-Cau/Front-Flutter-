import 'package:flutter/material.dart';

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

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사용자 정보'),
      ),
      body: Column(
        children: [
          UserInfoList(),
          Center(),
        ],
      ),
    );
  }
}

class UserInfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(16.0),
      child: UserInfoCard(
          user_id: "id",
          phonenumber: "010-1234-5678",
          website: "??",
          user_picture: "사진"),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String user_id;
  final String phonenumber;
  final String website;
  final String user_picture;

  UserInfoCard({
    required this.user_id,
    required this.phonenumber,
    required this.website,
    required this.user_picture,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user_id,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    phonenumber,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    website,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user_picture,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookname),
      ),
      backgroundColor: Color.fromARGB(232, 226, 231, 238),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1509021436665-8f07dbf5bf1d?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        width: 200,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            bookname + " 관련 도서",
                            style: TextStyle(fontSize: 28),
                          ),
                          Container(
                            height: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 138, 156, 160),
                            ),
                            child: Text(
                              bookname + " 관련 도서 정보",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // 페이지 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InfoPage()),
                          );
                        },
                        child: Icon(Icons.search)),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            child: Text("처음 화면으로"),
            onPressed: () {
              // 뒤로가기
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Blog'),
      ),
      body: Column(
        children: [
          BookList(),
          Center(
            child: BlogPostList(),
          ),
        ],
      ),
    );
  }
}

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 제목'),
      ),
      body: Column(
        children: [
          BookList(),
        ],
      ),
    );
  }
}

class BlogPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlogPostCard(
            title: "게시글제목1",
            views: "조회수 15",
            author: "아이디1",
            description: "내용1",
          ),
          SizedBox(height: 20),
          BlogPostCard(
            title: "게시글제목2",
            views: "조회수 없음",
            author: "아이디2",
            description: "내용2",
          ),
          SizedBox(height: 20),
          BlogPostCard(
            title: "게시글제목3",
            views: "조회수 350",
            author: "아이디3",
            description: "내용3",
          ),
        ],
      ),
    );
  }
}

class BlogPostCard extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String views;

  BlogPostCard({
    required this.title,
    required this.author,
    required this.description,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          views,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By $author',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Text("광고 이미지"),
            ElevatedButton(
                onPressed: () {
                  // 페이지 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlogPage()),
                  );
                },
                child: Icon(Icons.forward)),
          ],
        ),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(16.0),
      child: BookCard(
        booktitle: "책제목",
        bookauthor: "저자",
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String booktitle;
  final String bookauthor;

  BookCard({
    required this.booktitle,
    required this.bookauthor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 221, 159),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booktitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'By $bookauthor',
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 209, 129, 129)),
            ),
          ],
        ),
      ),
    );
  }
}
