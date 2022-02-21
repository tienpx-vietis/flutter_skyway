import 'package:flutter/cupertino.dart';
import 'package:flutter_skyway/core/base.dart';
import 'package:flutter_skyway/presentation/video_chat/video_chat.suc.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/skyway_peer.dart';
import '../../utils/constants.dart';

part 'video_chat.viewmodel.g.dart';

class VideoChatViewModel = _VideoChatViewModel with _$VideoChatViewModel;

abstract class _VideoChatViewModel extends BaseViewModel with Store {
  @observable
  bool isShowingNotification = true;

  @observable
  int numberOfPeople = 1;

  ObservableList<IncomingPerson> incomingPeople = ObservableList();

  VideoChatSceneUseCaseType useCase;

  _VideoChatViewModel(this.useCase);

  SkywayPeer? peer;

  @override
  void onInit() async {
    super.onInit();
    try {
      // peer = await useCase.connect("b4c7675c-056e-47cb-a9ec-2a0f9f4904c2", "localhost11", _onSkywayEvent);
    } on Exception catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
  }

  @action
  rotateCameraTrigger() {}

  @action
  toggleCameraTrigger() {}

  @action
  toggleMicTrigger() {}

  @action
  declineTrigger() {}

  @action
  increaseNumberOfPeople() async {
    numberOfPeople = (numberOfPeople + 1) % 4 + 1;
    incomingPeople.add(
      IncomingPerson(Assets.images.imgAvatarPlaceHolder.image(), "John ${incomingPeople.length + 1}"),
    );
    await Future.delayed(
      const Duration(seconds: 2),
      () async {
        incomingPeople.removeAt(0);
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    peer?.disconnect();
  }

  void _onSkywayEvent(SkywayEvent event, Map<dynamic, dynamic> args) {
    print(event);
  }
}

class IncomingPerson {
  final Widget _circleImage;
  final String _name;

  Widget get circleImage => _circleImage;

  String get name => _name;

  IncomingPerson(this._circleImage, this._name);
}
