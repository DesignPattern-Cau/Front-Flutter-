import 'package:flutter/material.dart';
import 'package:flutter_web/main.dart';

const enable = true;

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
                          Row(children: [
                            Expanded(
                                child: Text(
                              bookname + " 관련 도서명",
                              style: TextStyle(fontSize: 28),
                            )),
                            BookEnable(),
                          ]),
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
                        //  onPressed: () {
                        // 페이지 이동
                        //      Navigator.push(
                        //      context,
                        //    MaterialPageRoute(builder: (context) => InfoPage()),
                        //);

                        // },
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: InfoPage(),
                                  insetPadding:
                                      const EdgeInsets.fromLTRB(0, 80, 0, 80),
                                  actions: [
                                    TextButton(
                                      child: const Text('확인'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
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
        title: Text("정보"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Image.network(
              "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTda9RBygOiZk8qT1zs2eDjdYv5wCKT1vCfn94GXiLHY0Xjlv3b",
              width: 200,
            ),
          ),
          BookList(),
          BookEnable(),
        ],
      ),
    );
  }
}

class BookEnable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: (enable == false)
            ? Text("대출 가능")
            : Text(
                "대출 불가",
                style: TextStyle(color: Colors.red),
              ));
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
        bookauthor: "저자, 이런저런 정보",
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
