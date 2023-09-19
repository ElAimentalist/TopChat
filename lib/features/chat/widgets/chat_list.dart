import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topchat_ui/features/chat/controller/chat_controller.dart';
import '../../../common/widgets/loader.dart';
import '../../../info.dart';
import '../../../widgets/my_message_card.dart';
import '../../../widgets/sender_message_card.dart';

class ChatList extends ConsumerWidget {
  final String receiverUserId;
  const ChatList({
    Key? key,
    required this.receiverUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.read(chatControllerProvider).chatStream(receiverUserId),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                if (messages[index]['isMe'] == true) {
                  return MyMessageCard(
                    message: messages[index]['text'].toString(),
                    date: messages[index]['time'].toString(),
                  );
                }
                return SenderMessageCard(
                  message: messages[index]['text'].toString(),
                  date: messages[index]['time'].toString(),
                );
              });
        });
  }
}
