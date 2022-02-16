import 'package:flutter/cupertino.dart';
import 'package:flutter_skyway/core/base.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../app/app.pages.dart';

part 'home.viewmodel.g.dart';

enum CallModeType { sfu, mesh }
class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel extends BaseViewModel with Store {
  final formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  @observable
  String roomName = "";

  @observable
  CallModeType callMode = CallModeType.sfu;

  @override
  void onInit() {
    super.onInit();
  }

  @action
  showVideoChatView() {
    if (isFormValid) {
      Get.toNamed(Routes.VIDEO_CHAT);
    }
  }

  @action
  setSFUCallMode() {
    callMode = CallModeType.sfu;
  }

  @action
  setMESHCallMode() {
    callMode = CallModeType.mesh;
  }

  @action
  String? roomNameValidator(String? value) =>
      (value == null || value.isEmpty || value.length > 20) ? "Invalid" : null;
}
