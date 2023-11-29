import 'package:flutter/material.dart';
import 'package:flutter_web/main.dart';
import '../model/book.dart';

bool enable = false;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    String result;
    if (type == "title") {
      result = "제목";
    } else {
      result = "작가";
    }

    int k = booklist.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(result + " 검색결과 : $k개"),
      ),
      backgroundColor: Color.fromARGB(255, 241, 245, 223),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < booklist.length; i++)
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.network(
                      booklist[i].imgURL,
                      width: 200,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                              child: Text(
                            booklist[i].title,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          )),
                          BookEnable(booklist[i].quantity),
                        ]),
                        Container(
                          height: 280,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Text(
                            " - " + booklist[i].description,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
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
                                    booklist[i].authorName,
                                    booklist[i].sales,
                                    booklist[i].category,
                                    booklist[i].likes,
                                    booklist[i].description,
                                    booklist[i].registerAt,
                                    booklist[i].ISBN,
                                    booklist[i].page,
                                    booklist[i].imgURL),
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
            SizedBox(height: 60),
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
  String authorName;
  int sales;
  String category;
  int likes;
  String description;
  String registerAt;
  String ISBN;
  int page;
  String imgURL;

  InfoPage(
      this.book_idx,
      this.title,
      this.price,
      this.quantity,
      this.authorName,
      this.sales,
      this.category,
      this.likes,
      this.description,
      this.registerAt,
      this.ISBN,
      this.page,
      this.imgURL,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상세 정보"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.network(
                imgURL,
                width: 200,
                height: 300,
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.all(16.0),
              child: BookCard(
                booktitle: title,
                bookauthor: authorName,
                price: price,
                ISBN: ISBN,
                page: page,
                category: category,
              ),
            ),
            BookEnable(quantity),
          ],
        ),
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
  String category;

  BookCard({
    required this.booktitle,
    required this.bookauthor,
    required this.price,
    required this.ISBN,
    required this.page,
    required this.category,
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "작가 : " + bookauthor,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "카테고리 : " + category,
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
