import 'package:flutter/material.dart';
import 'package:flutter_skyway/core/base.dart';
import 'package:flutter_skyway/presentation/home/home.viewmodel.dart';

class HomeView extends BaseView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Start Video Call",
                style: TextStyle(
                  fontFamily: FontFamily.roboto,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF222222),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Start video call in mode: ",
                style: TextStyle(
                  fontFamily: FontFamily.roboto,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: Color(0xFF222222),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 39,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFF2F2F2),
                                ),
                              ),
                              onPressed:
                                  viewModel.setCallModeType(CallModeType.sfu),
                              child: const Text(
                                "SFU",
                                style: TextStyle(
                                    fontFamily: FontFamily.roboto,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 39,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFE14D4D),
                                ),
                              ),
                              onPressed:
                                  viewModel.setCallModeType(CallModeType.mesh),
                              child: const Text(
                                "MESH",
                                style: TextStyle(
                                    fontFamily: FontFamily.roboto,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    SizedBox(
                      // width: 312,
                      height: 40,
                      child: Form(
                        key: viewModel.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          initialValue: viewModel.roomName,
                          onChanged: (value) => viewModel.roomName = value,
                          validator: viewModel.roomNameValidator,
                          decoration: const InputDecoration(
                            hintText: "Room Name",
                            hintStyle: TextStyle(
                                fontFamily: FontFamily.roboto,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 39,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        onPressed: viewModel.toHostVideoChat,
                        child: const Text(
                          "HOST",
                          style: TextStyle(
                            fontFamily: FontFamily.roboto,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 39,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        onPressed: viewModel.toJoinVideoChat,
                        child: const Text(
                          "JOIN",
                          style: TextStyle(
                            fontFamily: FontFamily.roboto,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
