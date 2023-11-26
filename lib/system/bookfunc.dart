import 'dart:convert';

import '../model/book.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

Future<List<Book>> makeBookList(String typeValue, String keywordValue) async {
  List<Book> booklist = [];
  String strUrl =
      back_uri + "/music_info?type=" + typeValue + "&keyword=" + keywordValue;
  String id = 'default';
  var url = Uri.parse(strUrl);
  List<dynamic> result = [];

  var response = await http.get(url);
  int? resultcode = response.statusCode;
  if (resultcode != 200) {
  } else {
    Map decodedJson = jsonDecode(jsonDecode(response.body));
    result = decodedJson["booklist"];
    for (int i = 0; i < result.length; i++) {
      Book currBook = Book(
          result[i]['book_idx'],
          result[i]['title'],
          result[i]['price'],
          result[i]['quantity'],
          result[i]['author_id'],
          result[i]['sales'],
          result[i]['category_id'],
          result[i]['likes'],
          result[i]['description'],
          result[i]['register_at'],
          result[i]['ISBN'],
          result[i]['page']);
      booklist.add(currBook);
    }
  }

  return booklist;
}
