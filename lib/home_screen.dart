import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              'Digital Ai',
              style: GoogleFonts.roboto(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1,
              ),
            ),
            Text(
              'Portraits',
              style: GoogleFonts.roboto(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF05A46),
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                SizedBox(
                  height: 265.h,
                  width: 358.w,
                  child: PageView.builder(
                    itemCount: carouselList.length,
                    onPageChanged: (value) =>
                        setState(() => selectedIndex = value),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          carouselList[index],
                          height: 265.h,
                          width: 358.w,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SizedBox(
                    height: 12,
                    width: 72,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == selectedIndex) {
                          return Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: 12,
                            width: 12,
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          height: 12,
                          width: 12,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 8);
                      },
                      itemCount: carouselList.length,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Categories',
              style: GoogleFonts.roboto(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF05A46),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              crossAxisCount: 3,
              children: gridList.map((e) {
                return Image.asset(
                  e,
                  fit: BoxFit.fill,
                );
              }).toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight + 50,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black.withOpacity(0.2))),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomBarItems.map((e) {
              return Column(
                children: [
                  SvgPicture.asset(e.icon),
                  Text(
                    e.label,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<String> carouselList = [
  'assets/images/carousel-image-1.png',
  'assets/images/carousel-image-2.png',
  'assets/images/carousel-image-3.png',
  'assets/images/carousel-image-4.png',
];

List<String> gridList = [
  'assets/images/grid-1.png',
  'assets/images/grid-2.png',
  'assets/images/grid-3.png',
  'assets/images/grid-4.png',
  'assets/images/grid-5.png',
  'assets/images/grid-6.png',
];

List<BottomBarItem> bottomBarItems = [
  BottomBarItem(icon: 'assets/icons/discover.svg', label: 'Discover'),
  BottomBarItem(icon: 'assets/icons/favourites.svg', label: 'Favourites'),
  BottomBarItem(icon: 'assets/icons/cart.svg', label: 'Cart'),
  BottomBarItem(icon: 'assets/icons/profile.svg', label: 'Profile'),
];

class BottomBarItem {
  String icon;
  String label;
  BottomBarItem({
    required this.icon,
    required this.label,
  });
}
