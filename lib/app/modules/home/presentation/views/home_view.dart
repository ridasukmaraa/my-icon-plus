import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_icon_plus/app/modules/home/presentation/widgets/internet_promo_card.dart';
import 'package:my_icon_plus/app/modules/home/presentation/widgets/menu_item.dart';
import 'package:my_icon_plus/app/modules/home/presentation/widgets/promo_widget.dart';
import 'package:my_icon_plus/app/modules/home/presentation/widgets/testimonial_card.dart';
import 'package:my_icon_plus/constants/ui_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.find();
  final ScrollController _scrollController = ScrollController();
  double scrollProgress = 0.0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      setState(() {
        scrollProgress = (offset / 80).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor =
        Color.lerp(Colors.white.withAlpha(0), Colors.white, scrollProgress)!;
    final bgSearchColor =
        Color.lerp(Colors.white, Colors.grey.shade100, scrollProgress);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 260,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.transparent,
                                ],
                                stops: [1.0, 0.75, 0.0],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.asset(
                              'assets/images/bg_banner_01.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildWalletInformation(),
                    const SizedBox(height: 8),
                    _buildGridPromo(),
                    const SizedBox(height: 16),
                    _buildPromoOne(),
                    const SizedBox(height: 16),
                    _buildPromoBanner(),
                    const SizedBox(height: 16),
                    _buildInternetPromo(),
                    const SizedBox(height: 16),
                    _buildPromoTwo(),
                    const SizedBox(height: 16),
                    _buildTestimonies(),
                  ],
                ),
              ),
            ],
          ),

          Container(
            height: 90,
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(24)),
              boxShadow: scrollProgress > 1
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(scrollProgress * 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: Align(
              alignment: Alignment.center,
              child: _buildSearchBar(bgSearchColor!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            _defaultBoxShadow(),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: UIColors.primary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_sharp),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.discount),
              label: 'Promo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Akun',
            ),
          ],
        ),
      )
      ,
    );
  }

  BoxShadow _defaultBoxShadow() => BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 4,
        offset: const Offset(0.5, 0.5),
      );

  Widget _buildSearchBar(Color bgSearchColor) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: bgSearchColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          _defaultBoxShadow(),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text('Paket Internet', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildWalletInformation() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [_defaultBoxShadow()]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100.withOpacity(0.8),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: UIColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 8),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text('Rp1.000.000',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(letterSpacing: 0, fontSize: 14)),
                  Text(
                    '500 coins',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.normal),
                  )
                ],
              )
            ],
          ),
          Wrap(
            children: [
              _buildActionButton(text: 'Pay', icon: Icons.payments),
              const SizedBox(width: 16),
              _buildActionButton(text: 'Top Up', icon: Icons.add_circle),
              const SizedBox(width: 16),
              _buildActionButton(text: 'More', icon: Icons.change_circle_rounded),
            ],
          )
        ],
      ),
    );
  }


  Widget menuItem({
    required String title,
    required String badgeText,
    required Color backgroundColor,
    required String iconAsset,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Icon dengan background
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(iconAsset, width: 36),
              ),
            ),
            // Badge di pojok kiri atas
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
                  badgeText,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }



  Column _buildActionButton({required String text, required IconData icon}) {
    return Column(
      children: [
        Icon(icon, color: UIColors.primary, size: 24,),
        Text(text, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11)),
      ],
    );
  }

  Widget _buildGridPromo() {
    return SizedBox(
      height: 240,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 0.9,
        children: controller.menus.map((menu) => MenuItem(menu: menu)).toList(),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          _defaultBoxShadow()
        ]
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Diskon 10% biaya pemasangan bulan ini!",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.arrow_circle_right_rounded, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildPromoOne() {
    return PromoWidget(
      title: "PROMO UPGRADE LAYANAN",
      subtitle: "Upgrade layanan internet minimal 20 dan 35 Mbps. Kamu sudah bisa mendapatkan Hadiah Menarik loh dari MinICON",
      logoAsset: "assets/logos/logo.png",
      onTap: () {
        // Handle "See All"
      },
    );
  }

  Widget _buildPromoTwo() {
    return PromoWidget(
      title: "Kini Hadir Layanan ICONPLAY",
      subtitle: "Nikmati film, serial, dan acara berkualitas HD. Tingkatkan pengalaman menonton Anda dengan berlangganan ICONPLAY",
      logoAsset: "assets/logos/logo.png",
      onTap: () {
        // Handle "See All"
      },
    );
  }

  Widget _buildInternetPromo() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        itemCount: controller.promoList.length,
        itemBuilder: (context, index) {
          final promo = controller.promoList[index];
          return InternetPromoCard(
            entity: promo,
            onTap: () {
            },
          );
        },
      ),
    );
  }

  Widget _buildTestimonies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Testimoni Pengguna',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),

        // List of Testimonial Cards
        SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            itemCount: controller.testimonialData.length,
            itemBuilder: (context, index) {
              final testimony = controller.testimonialData[index];
              return Align(
                alignment: Alignment.topCenter,
                child: TestimonialCard(
                  entity: testimony,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}
