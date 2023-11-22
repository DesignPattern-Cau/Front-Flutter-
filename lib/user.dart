import 'package:flutter/material.dart';

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
