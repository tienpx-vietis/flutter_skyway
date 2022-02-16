import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_skyway/core/architecture/base_view.dart';
import 'package:flutter_skyway/presentation/group_chat/group_chat.viewmodel.dart';
import 'package:flutter_skyway/presentation/group_chat/message_model.dart';
import 'package:flutter_skyway/presentation/group_chat/user_model.dart';
import 'package:flutter_skyway/presentation/group_chat/widgets/circle_avatar.dart';
import 'package:flutter_skyway/presentation/group_chat/widgets/message_bubble.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GroupChatView extends BaseView<GroupChatViewModel> {
  GroupChatView({Key? key}) : super(key: key);

  final vm = Get.find<GroupChatViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Call ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const Text(
              '3 members',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        child: CircleThumbAvatar(
                          color: Colors.blue,
                        ),
                        left: 50,
                      ),
                      const Positioned(
                        child: CircleThumbAvatar(
                          color: Colors.green,
                        ),
                        left: 25,
                      ),
                      const Positioned(
                        child: CircleThumbAvatar(
                          color: Colors.yellow,
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Video chat',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '3 participants',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    child: const Text(
                      'Back',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Observer(
                  builder: (context) => ListView.builder(
                    reverse: true,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: vm.messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == vm.messages.length) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 14, bottom: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff728391).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                DateFormat('dd MMMM').format(DateTime.now()),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        );
                      }
                      return SentBubleMessage(
                        isSent: vm.messages[index].userSentId == 1,
                        hasAvatar: vm.hasAvatar(index),
                        messageModel: vm.messages[index],
                        userModel:
                            vm.users[(vm.messages[index].userSentId ?? 1) - 1],
                      );
                    },
                  ),
                ),
              ),
            ),
            TextFormField(
              maxLines: null,
              controller: vm.messageController,
              decoration: InputDecoration(
                hintText: 'Message',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                suffixIcon: IconButton(
                    onPressed: () {
                      vm.addMessage();
                      vm.messageController.clear();
                    },
                    icon: const Icon(
                      Icons.send_outlined,
                      color: Colors.blueAccent,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
