import 'package:flutter/material.dart';

import '../models/models.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 80,
            )
          : const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).colorScheme.secondary
            : const Color(0xFFFFEFEE),
        borderRadius: isMe
            ? const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message.text,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          iconSize: 30,
          color: message.isLiked
              ? Theme.of(context).colorScheme.primary
              : Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).colorScheme.primary,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration.collapsed(
                  hintText: "Send a message ..."),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
            iconSize: 25,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    padding: const EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
