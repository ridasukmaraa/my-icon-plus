import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_icon_plus/app/modules/home/domain/entities/internet_promo_entity.dart';
import 'package:my_icon_plus/app/modules/home/domain/entities/menu_entity.dart';
import 'package:my_icon_plus/app/modules/home/domain/entities/testimony_entity.dart';

class HomeController extends GetxController {
  final List<MenuEntity> menus = [
    MenuEntity(
        title: 'Paket Internet',
        iconAsset: 'assets/icons/ic_internet.png',
        backgroundColor: Colors.grey.shade100),
    MenuEntity(
        title: 'Cek Coverage',
        iconAsset: 'assets/icons/ic_coverage.png',
        backgroundColor: Colors.green.shade100,
        badge: 'NEW'),
    MenuEntity(
        title: 'Daftar Baru',
        iconAsset: 'assets/icons/ic_registration.png',
        backgroundColor: Colors.orange.shade100,
        badge: 'PROMO'),
    MenuEntity(
        title: 'Bayar Tagihan',
        iconAsset: 'assets/icons/ic_payment.png',
        backgroundColor: Colors.pink.shade100),
    MenuEntity(
        title: 'Lacak Status',
        iconAsset: 'assets/icons/ic_tracking.png',
        backgroundColor: Colors.teal.shade100,
        badge: 'NEW'),
    MenuEntity(
        title: 'Hubungi CS',
        iconAsset: 'assets/icons/ic_cs.png',
        backgroundColor: Colors.blue.shade100),
    MenuEntity(
        title: 'Info & Promo',
        iconAsset: 'assets/icons/ic_information.png',
        backgroundColor: Colors.red.shade100),
    MenuEntity(
        title: 'Panduan',
        iconAsset: 'assets/icons/ic_guide.png',
        backgroundColor: Colors.purple.shade100,
        badge: 'HOT'),
  ];

  final promoList = [
    InternetPromoEntity(
        title: "Paket ICONNET 35",
        price: "Rp 239.000 /bulan",
        speed: "35 Mbps"),
    InternetPromoEntity(
        title: "Paket ICONNET 50",
        price: "Rp 299.000 /bulan",
        speed: "50 Mbps"),
    InternetPromoEntity(
        title: "Paket ICONNET 100",
        price: "Rp 399.000 /bulan",
        speed: "100 Mbps")
  ];

  final testimonialData = [
    TestimonyEntity(
      name: 'WAHYU ANGGORO HADI, S.FARM., APT',
      title:
          'SANG INOVATOR DESA DIGITAL Kepala Desa Panggungharjo, Kec. Sweon, Kab. Bantul Daerah Istimewa Yogyakarta',
      message:
          'Kehadiran platform digital mampu memudahkan dan menigkatkan proses pembangunan pemerintah maupun kualitas hidup warga desa Panggungharjo Kehadiran ICONNET menjadi salah satu infrastruktur teknologi penting untuk mewujudkan cita-cita besar dari pemernitah desa maupun warga desa Panggungharjo.',
      avatarPath: 'assets/images/wahyudi.png',
    ),
    TestimonyEntity(
      name: 'IBU MURNI',
      title: 'Carik Desa Sindumartini, Kab. Sleman',
      message:
          'Saya memakai Iconnet karena harganya relatif murah dan terjangkau. Sehingga itu cocok untuk warga saya yang rata-rata ekonominya mengengah kebawah. Kemudian yang Saya suka itu karena dia unlimited, mau internet kapanpun bebas. Makannya saya yakin kalau iconnet bisa menjadi solusi bagi permasalahan yang ada di lingkungan kami',
      avatarPath: 'assets/images/murni.png',
    ),
    TestimonyEntity(
        name: 'WIYADI',
        title: 'Wirausahawan',
        message:
            'Internet membantu pembesaran di omset, akses pasar, dan ekspansi perusahaan. Jadi menurut saya, keren. Karena sekarang yang ga butuh internet ya siapa sih? ga di desa, ga di kota, semuanya sama. Semuanya membutuhkan internet, dan itu yang dijawab oleh ICONNET.',
        avatarPath: 'assets/images/wiyadi.png'),
  ];

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
