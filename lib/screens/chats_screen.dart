import 'package:ieatta/controllers/chats_controller.dart';
import 'package:ieatta/controllers/stories_controller.dart';
import 'package:ieatta/models/chat.dart';
import 'package:ieatta/widgets/chat_widget.dart';
import 'package:ieatta/widgets/recent_chat_widget.dart';
import 'package:ieatta/widgets/search_widget.dart';
import 'package:ieatta/widgets/stories_widget.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: StoriesWidget(
            rounded: true,
          ),
        ),
        StreamBuilder(
          stream: ChatsController.getChats(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Chat> chats = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) => RecentChatWidget(
                chat: chats[index],
              ),
              itemCount: chats.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            );
          },
        )
      ],
    );
  }
}
