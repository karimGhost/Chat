import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:karrayy_s_application4/main.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:karrayy_s_application4/theme/theme_helper.dart';
import 'package:karrayy_s_application4/widgets/custom_text_form_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];

  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Chat(
              messages: _messages,
              onSendPressed: _handleSendPressed,
              user: _user,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: appTheme.gray90001,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: theme.textTheme.bodyMedium,
                        border: InputBorder.none,
                      ),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: appTheme.blueGray900,
                    ),
                    onPressed: () {
                      _handleSendPressed(types.PartialText(
                        text: _messageController.text,
                      ));
                      _messageController
                          .clear(); // Clear the input after sending
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "82091008-a484-4a89-ae75-a22bf8d6f3ac",
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}
