import 'package:flutter/material.dart';
import 'package:flutter_skyway/presentation/group_chat/message_model.dart';
import 'package:flutter_skyway/presentation/group_chat/user_model.dart';
import 'package:flutter_skyway/presentation/group_chat/widgets/circle_avatar.dart';
import 'package:intl/intl.dart';

class SentBubleMessage extends StatelessWidget {
  const SentBubleMessage(
      {Key? key,
      required this.isSent,
      required this.userModel,
      required this.messageModel,
      required this.hasAvatar})
      : super(key: key);

  final bool isSent;
  final UserModel userModel;
  final MessageModel messageModel;
  final bool hasAvatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          (!isSent && hasAvatar)
              ? CircleThumbAvatar(
                  color: userModel.userColor(userModel.id ?? 0),
                  height: 15,
                  width: 15,
                  padding: 0,
                )
              : const SizedBox(
                  width: 15,
                ),
          if (isSent)
            const SizedBox(
              width: 50,
            ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSent ? const Color(0xffEFFEDD) : const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 6, 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(messageModel.content ?? ''),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      DateFormat('hh:mm a')
                          .format(messageModel.time ?? DateTime.now()),
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              isSent ? const Color(0xff62AC55) : const Color(0xffA1AAB3)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!isSent)
            const SizedBox(
              width: 50,
            ),
          const SizedBox(
            width: 5,
          ),
          (isSent && hasAvatar)
              ? CircleThumbAvatar(
                  color: userModel.userColor(userModel.id ?? 0),
                  height: 15,
                  width: 15,
                  padding: 0,
                )
              : const SizedBox(
                  width: 15,
                ),
        ],
      ),
    );
  }
}
