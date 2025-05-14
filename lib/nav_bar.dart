import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
      child: Container(
        color: const Color(0xff2E2739),
        height: Get.height * 0.11,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6, top: 10),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: ImageIcon(AssetImage('assets/images/dashboard.png')),
                ),
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6, top: 10),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: ImageIcon(AssetImage('assets/images/watch.png')),
                ),
              ),
              label: 'Watch',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6, top: 10),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: ImageIcon(AssetImage('assets/images/lib.png')),
                ),
              ),
              label: 'Media Library',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6, top: 10),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: ImageIcon(AssetImage('assets/images/more.png')),
                ),
              ),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
