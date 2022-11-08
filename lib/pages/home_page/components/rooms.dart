import 'package:flutter/material.dart';
import 'package:nps_social/configs/palette.dart';
import 'package:nps_social/models/user_model.dart';
import 'package:nps_social/widgets/widget_profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<UserModel> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }

            final UserModel user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: WidgetProfileAvatar(
                imageUrl: user.avatar ?? '',
                isOnline: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("Create Room"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Palette.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          //side: const BorderSide(width: 3, color: Colors.blueAccent),
        ),
        side: BorderSide(width: 3, color: Colors.blueAccent[200]!),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text("Create\nRoom"),
        ],
      ),
    );
  }
}
