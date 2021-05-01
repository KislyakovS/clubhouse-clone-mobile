import 'package:clubhouse_clone/config/palette.dart';
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              UpcomingRooms(upcomingRooms: upcomingRoomsList),
              const SizedBox(
                height: 12,
              ),
              ...roomsList.map((e) => RoomCard(room: e))
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor
                  ])),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(24)),
              child: const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(CupertinoIcons.add,
                        size: 21, color: Colors.white)),
                TextSpan(
                    text: ' Start room',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))
              ])),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                    icon: const Icon(
                      CupertinoIcons.circle_grid_3x3_fill,
                      color: Colors.black,
                    ),
                    onPressed: null),
                Positioned(
                  right: 5.6,
                  bottom: 10.8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).accentColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
