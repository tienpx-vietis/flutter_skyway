import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndCallDialog extends StatelessWidget {
  const EndCallDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('End the call for everyone?'),
      content:
          const Text('Are you sure you want to end the call for everyone?'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('CANCEL')),
        TextButton(
            onPressed: () {},
            child: const Text(
              'END',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
