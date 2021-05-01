import 'package:clubhouse_clone/data.dart';
import 'package:clubhouse_clone/screens/room_screen.dart';
import 'package:clubhouse_clone/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true, builder: (_) => RoomScreen(room: room))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 28,
                            top: 20,
                            child: UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: 48,
                            ),
                          ),
                          UserProfileImage(
                            imageUrl: room.speakers[1].imageUrl,
                            size: 48,
                          )
                        ],
                      ),
                    )),
                    Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                                  '${e.givenName} ${e.familyName} 💬',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 16),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text:
                                          '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                                  const WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  )),
                                  TextSpan(text: ' / ${room.speakers.length} '),
                                  const WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 16,
                                    color: Colors.grey,
                                  ))
                                ]),
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            )
                          ]),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
