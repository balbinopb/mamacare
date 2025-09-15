import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamacare/app/constants/app_colors.dart';
import 'package:mamacare/app/routes/app_pages.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  OverlayEntry? _popupEntry;

  void _showCustomPopup(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);

    _popupEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + button.size.height + 4,
        left: offset.dx - 100,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _popupEntry?.remove();
            },
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () {
                  _popupEntry?.remove();
                  Get.toNamed(Routes.USER_HISTORY);
                },
                child: Container(
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Detail Riwayat',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_popupEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () => _showCustomPopup(context),
    );
  }
}
