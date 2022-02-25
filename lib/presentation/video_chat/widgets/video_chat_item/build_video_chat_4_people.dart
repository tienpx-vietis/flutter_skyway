part of '../../video_chat.view.dart';

extension BuildVideoChat4People on VideoChatView {
  Widget _buildVideoChat4People() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _buildItemVideoChat(
                name: "You",
                uiItemVideoView: Assets.images.imgAvatarPlaceHolder2
                    .image(fit: BoxFit.cover),

              ),
              _buildItemVideoChat(
                name: "You",
                uiItemVideoView: _createRemoteView(
                    viewModel.peers.keys.first),

              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _buildItemVideoChat(
                name: "You",
                uiItemVideoView: _createRemoteView(
                    viewModel.peers.keys.elementAt(1)),
              ),
              _buildItemVideoChat(
                name: "You",
                uiItemVideoView: _createRemoteView(
                    viewModel.peers.keys.elementAt(2)),

              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemVideoChat(
      {required String name,
      required Widget uiItemVideoView}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: uiItemVideoView,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name)
                        .defaultStyle()
                        .color(Colors.white)
                        .fontStyle(FontStyle.normal)
                        .fontWeight(FontWeight.w500)
                        .fontSize(14),
                    const SizedBox(
                      width: 6,
                    ),
                    Assets.images.icMicUnmute.svg(height: 16, width: 16),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 8,
                ),
                child: Assets.images.icDots.svg(height: 24, width: 24),
              ),
            ),
            // const Align(
            //   alignment: Alignment.center,
            //   child: CircularProgressIndicator(
            //     color: Colors.white,
            //     strokeWidth: 2,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
