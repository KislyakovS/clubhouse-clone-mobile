import 'package:clubhouse_clone/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile(
      {Key? key,
      required this.imageUrl,
      required this.name,
      this.size = 48,
      this.isNew = false,
      this.isMuted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              child: UserProfileImage(
                imageUrl: imageUrl,
                size: size,
              ),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Text(
                    '🎉',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: const Icon(CupertinoIcons.mic_slash_fill),
                ),
              )
          ],
        ),
        SizedBox(height: 3),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
