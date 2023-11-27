import 'package:flutter/material.dart';
import 'package:flutter_web/main.dart';
import '../model/book.dart';

bool enable = false;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      Book currBook = Book(i, ("책이름"), i * 10000, i % 2, i, i * 10, i, i,
          "재밌는 책입니다", DateTime.now(), "isbn", i);
      booklist.add(currBook);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(bookname),
      ),
      backgroundColor: Color.fromARGB(232, 226, 231, 238),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //for (int i = 0; i < booklist.length; i++)
            for (int i = 0; i < booklist.length; i++)
              Row(
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
                            booklist[i].title,
                            style: TextStyle(fontSize: 28),
                          )),
                          BookEnable(booklist[i].quantity),
                        ]),
                        Container(
                          height: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 138, 156, 160),
                          ),
                          child: Text(
                            " 설명: " + booklist[i].description,
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
                                content: InfoPage(
                                    booklist[i].book_idx,
                                    booklist[i].title,
                                    booklist[i].price,
                                    booklist[i].quantity,
                                    booklist[i].author_id,
                                    booklist[i].sales,
                                    booklist[i].category_id,
                                    booklist[i].likes,
                                    booklist[i].description,
                                    booklist[i].register_at,
                                    booklist[i].ISBN,
                                    booklist[i].page),
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
              ),
            if (booklist.length == 0) NoResult(),
            ElevatedButton(
              child: Text("처음 화면으로"),
              onPressed: () {
                // 뒤로가기
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NoResult extends StatelessWidget {
  const NoResult({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Container(
          child: Center(
        child: Text(
          "검색 결과가 없습니다. ",
          style: TextStyle(color: Colors.red),
        ),
      )),
    );
  }
}

class InfoPage extends StatelessWidget {
  int book_idx;
  String title;
  int price;
  int quantity;
  int author_id;
  int sales;
  int category_id;
  int likes;
  String description;
  DateTime register_at;
  String ISBN;
  int page;

  InfoPage(
      this.book_idx,
      this.title,
      this.price,
      this.quantity,
      this.author_id,
      this.sales,
      this.category_id,
      this.likes,
      this.description,
      this.register_at,
      this.ISBN,
      this.page,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상세 정보"),
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
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.all(16.0),
            child: BookCard(
              booktitle: title,
              bookauthor: "$author_id",
              price: price,
              ISBN: ISBN,
              page: page,
            ),
          ),
          BookEnable(quantity),
        ],
      ),
    );
  }
}

class BookEnable extends StatelessWidget {
  int able;
  BookEnable(this.able);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (able != 0)
            ? Text("대출 가능 - 남은 권수 : $able권",
                style: TextStyle(color: Colors.blue))
            : Text(
                "대출 불가",
                style: TextStyle(color: Colors.red),
              ));
  }
}

class BookCard extends StatelessWidget {
  String booktitle;
  String bookauthor;
  int price;
  String ISBN;
  int page;
  BookCard({
    required this.booktitle,
    required this.bookauthor,
    required this.price,
    required this.ISBN,
    required this.page,
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
              "작가 : " + bookauthor,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "가격 : $price원",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "ISBN : " + ISBN,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "페이지 수 : $page장",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
