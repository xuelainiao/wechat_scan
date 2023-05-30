import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:vibration/vibration.dart';

import '../widget/bottom_bar_widget.dart';
import 'scan_page.dart';
import 'translator_page.dart';

class WechatScanPage extends StatefulWidget {
  const WechatScanPage({super.key});

  @override
  State<WechatScanPage> createState() => _WechatScanPageState();
}

class _WechatScanPageState extends State<WechatScanPage> {
  int nowPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      _onPageChange();
    });
  }

  Future<void> _onPageChange() async {
    if (await Vibration.hasVibrator() as bool &&
        nowPage != controller.page!.round()) {
      Vibration.vibrate(duration: 100, amplitude: 200);
    }
    nowPage = controller.page!.round();
  }

  //弹出底部抽屉
  void _bottomSheet() {
    Get.bottomSheet(Wrap(
      children: [
        GestureDetector(
          onTap: () {
            EasyLoading.showToast('未实现');
            Get.back();
          },
          child: Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text('将扫一扫添加到桌面', style: TextStyle(fontSize: 18)),
          ),
        ),
        Container(color: Colors.grey.shade100, height: 10),
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text('取消', style: TextStyle(fontSize: 18)),
          ),
        )
      ],
    ));
  }

  //关闭按钮
  // ignore: unused_element
  Widget _closeButton() {
    return GestureDetector(
        onTap: () => Get.back(),
        child: ClipOval(
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.close_outlined,
                    size: 15, color: Colors.black))));
  }

  //更多菜单
  Widget _moreButton() {
    return GestureDetector(
        onTap: _bottomSheet,
        child: const Icon(Icons.more_horiz, size: 29, color: Colors.white));
  }

  //底部菜单
  Widget _bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MenuSelector(controller),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
            controller: controller,
            children: const [ScanPage(), TranslatorPage()]),
        // Positioned(top: 38, left: 18, child: _closeButton()),
        Positioned(top: 34, right: 14, child: _moreButton()),
        _bottomBar(),
      ],
    );
  }
}
