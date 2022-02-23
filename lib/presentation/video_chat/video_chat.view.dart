import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skyway/core/base.dart';
import 'package:flutter_skyway/presentation/common.widgets/image_button.dart';
import 'package:flutter_skyway/presentation/video_chat/video_chat.viewmodel.dart';
import 'package:flutter_skyway/presentation/video_chat/widgets/skyway_canvas_view.dart';

part 'widgets/video_chat_item/build_video_chat_1_person.dart';
part 'widgets/video_chat_item/build_video_chat_2_people.dart';
part 'widgets/video_chat_item/build_video_chat_3_people.dart';
part 'widgets/video_chat_item/build_video_chat_4_people.dart';
part 'widgets/video_view.dart';

class VideoChatView extends BaseView<VideoChatViewModel> {
  const VideoChatView({Key? key}) : super(key: key);

  final ValueKey _localVideoKey = const ValueKey('localVideo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14161C),
      body: SafeArea(
        child: Observer(
          builder: (_) => Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            viewModel.goToChat();
                          },
                          child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Assets.images.icCircleBtnChat.svg(height: 44, width: 44),
                                ),
                                Positioned(
                                  top: -4,
                                  left: 27,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                    height: 24,
                                    width: 24,
                                    child: const Text(
                                      "1",
                                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 13),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            viewModel.showSetting();
                          },
                          child: Assets.images.icCircleBtnMore.svg(height: 44, width: 44),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Observer(
                    builder: (_) => Expanded(
                      child: viewModel.isFullScreenEnabled
                          ? buildVideoFullScreen(viewModel.videoFullScreen)
                          : _buildVideoChat(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageButton(
                          child: Assets.images.icCircleBtnRotate.svg(
                            height: 58,
                            width: 58,
                          ),
                          onPressed: viewModel.rotateCameraTrigger,
                        ),
                        Observer(builder: (context) {
                          return ImageButton(
                            onPressed: viewModel.toggleCameraTrigger,
                            child: Assets.images.icCircleBtnCamera.svg(
                              color: viewModel.isCameraEnabled ? null : Colors.red,
                              height: 58,
                              width: 58,
                            ),
                          );
                        }),
                        Observer(builder: (context) {
                          return ImageButton(
                            onPressed: viewModel.toggleMicTrigger,
                            child: Assets.images.icCircleBtnMic.svg(
                              color: viewModel.isAudioEnabled ? null : Colors.red,
                              height: 58,
                              width: 58,
                            ),
                          );
                        }),
                        ImageButton(
                          onPressed: () {
                            viewModel.declineTrigger();
                          },
                          child: Assets.images.icCircleBtnDecline.svg(
                            height: 58,
                            width: 58,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 86),
                  child: _buildNotification(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoChat() {
    return Observer(
      builder: (context) {
        if (viewModel.isConnected) {
          switch (viewModel.totalRemotePeer) {
            case 3:
              return _buildVideoChat4People();
            case 2:
              return buildVideoChat3People();
            case 1:
              return buildVideoChat2People();
            case 0:
              return buildVideoChat1Person();
            default:
              return buildVideoChat1Person();
          }
        }
        return Container();
      },
    );
  }

  Widget _buildNotification() {
    return Observer(
      builder: (_) => ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.notifications.length,
        itemBuilder: (_, index) {
          return buildNotificationItem(viewModel.notifications[index].circleImage, viewModel.notifications[index].name);
        },
      ),
    );
  }

  Widget buildNotificationItem(Widget circleWidget, String name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFF272F38).withOpacity(0.92),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 25,
            width: 25,
            child: CircleAvatar(
              child: circleWidget,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                  text: name,
                  style: const TextStyle(
                    fontFamily: FontFamily.roboto,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  children: const [
                    TextSpan(
                      text: " joined the voice chat.",
                      style: TextStyle(
                        fontFamily: FontFamily.roboto,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildVideoFullScreen(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: AspectRatio(
        aspectRatio: 6 / 4,
        child: SizedBox(
          height: 262,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: child,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        alignment: Alignment.center,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFD4D4D4).withOpacity(0.2),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("0:01")
                                .defaultStyle()
                                .fontSize(14)
                                .fontWeight(FontWeight.w400)
                                .color(Colors.white),
                            const SizedBox(
                              width: 4,
                            ),
                            Assets.images.icLock.svg(height: 16, width: 16)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: const Text("You").defaultStyle().fontSize(14).fontWeight(FontWeight.w500).color(Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12, right: 8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD4D4D4).withOpacity(0.2),
                    ),
                    child: Assets.images.icMask.svg(width: 20, height: 20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.videoFullScreen = const SizedBox();
                  viewModel.isFullScreenEnabled = false;
                },
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.close, size: 48),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
