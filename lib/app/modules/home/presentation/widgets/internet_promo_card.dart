import 'package:flutter/material.dart';
import 'package:my_icon_plus/app/modules/home/domain/entities/internet_promo_entity.dart';
import 'package:my_icon_plus/constants/ui_colors.dart';

class InternetPromoCard extends StatelessWidget {
  final InternetPromoEntity entity;
  final VoidCallback onTap;

  const InternetPromoCard({
    super.key,
    required this.entity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon/logo section
            Container(
              width: 100,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/ic_iconnet_35.png',
                    width: 80,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // Info section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Full Fiber to The Home\nUp to ",
                      style: TextStyle(fontSize: 12),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        children: [
                          TextSpan(
                            text: entity.speed,
                            style: TextStyle(
                              color: UIColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                            ),
                          ),
                          const TextSpan(text: " Download/Upload"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      entity.price,
                      style: TextStyle(
                        fontSize: 16,
                        color: UIColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "*Belum termasuk PPN",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi pemesanan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: UIColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        ),
                        child: const Text(
                          'Pesan Sekarang',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
