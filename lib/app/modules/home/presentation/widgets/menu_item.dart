import 'package:flutter/material.dart';
import 'package:my_icon_plus/app/modules/home/domain/entities/menu_entity.dart';

class MenuItem extends StatelessWidget {
  final MenuEntity menu;

  const MenuItem({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: menu.backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(
                  menu.iconAsset,
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            if (menu.badge != null)
              Positioned(
                top: -6,
                left: -6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    menu.badge!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          menu.title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
