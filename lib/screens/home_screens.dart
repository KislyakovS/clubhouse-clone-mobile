import 'package:clubhouse_clone/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse_clone/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 28,
            color: Colors.black,
          ),
          onPressed: null,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope_open,
              size: 26,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar,
              size: 28,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              size: 28,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          GestureDetector(
            onTap: null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 20, 10),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36.0,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
        children: [UpcomingRooms(upcomingRooms: upcomingRoomsList)],
      ),
    );
  }
}
