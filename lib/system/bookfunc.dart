import 'dart:convert';

import '../model/book.dart';
import 'package:http/http.dart' as http;
import '../main.dart';


Future<List<Book>> makeBookList(String typeValue,String keywordValue) async {
  List<Book> booklist=[];
  String strUrl = back_uri + "book/list?type="+typeValue+"&keyword="+keywordValue;
  String id = 'default';
  var url = Uri.parse(strUrl);
  List<dynamic> result = [];
  var response;

  try {
    response = await http.get(url);
  }
  catch(e){
    print(e);
  }
  int? resultcode = response.statusCode;
  if (resultcode != 200) {
  }
  else {
    Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
    result = decodedJson["results"];
    for (int i = 0; i<result.length;i++){
      Book currBook=Book(
          result[i]['bookIdx'],
          result[i]['title'],
          result[i]['price'],
          result[i]['quantity'],
          result[i]['authorName'],
          result[i]['sales'],
          result[i]['category'],
          result[i]['likes'],
          result[i]['description'],
          result[i]['registeredAt'],
          result[i]['isbn'],
          result[i]['page'],
          result[i]['imgURL']
      );
      booklist.add(currBook);
    }
  }

  return booklist;
}
