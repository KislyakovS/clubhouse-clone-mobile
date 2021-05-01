import 'dart:math';

import 'package:clubhouse_clone/config/palette.dart';
import 'package:clubhouse_clone/data.dart';
import 'package:clubhouse_clone/widgets/room_user_profile.dart';
import 'package:clubhouse_clone/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        leading: TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.chevron_down),
            label: const Text('All rooms')),
        actions: [
          IconButton(
              icon: const Icon(
                CupertinoIcons.doc,
                size: 28,
              ),
              onPressed: () {}),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      GestureDetector(
                        child: const Icon(CupertinoIcons.ellipsis),
                      )
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  )
                ],
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                  children: room.speakers
                      .map((e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            size: 66,
                            name: e.givenName,
                            isNew: Random().nextBool(),
                            isMuted: Random().nextBool(),
                          ))
                      .toList(),
                )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Followed by speakers',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 5,
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 60,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Others in room',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 5,
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 60,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100))
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(24)),
                child: const Text.rich(TextSpan(children: [
                  TextSpan(text: '✌🏽', style: TextStyle(fontSize: 20)),
                  TextSpan(
                      text: 'Leave quietly',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1))
                ])),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: null,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        CupertinoIcons.add,
                        size: 30,
                      ),
                    )),
                SizedBox(width: 15),
                GestureDetector(
                    onTap: null,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        CupertinoIcons.hand_raised,
                        size: 30,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
