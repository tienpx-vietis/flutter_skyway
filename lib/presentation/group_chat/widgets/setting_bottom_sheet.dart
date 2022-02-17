import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffE1E4E9),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              'Setting',
              style: TextStyle(
                  color: const Color(0xff222222),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Video and Audio',
              style: TextStyle(
                color: const Color(0xff50A7EA),
                fontSize: 15.sp,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/images/ic_share_screen.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Share screen',
                  style: TextStyle(
                    color: Color(0xff222222),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/images/ic_recording.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Start recording',
                  style: TextStyle(
                    color: Color(0xff222222),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
