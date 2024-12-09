import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screen = [
    /// home screen
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/svg/home.svg",
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Let's have connect together",
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),

    /// Feeds screen
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/svg/feeds.svg",
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "No feeds added",
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),

    /// setting tab
    /// Feeds screen
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/svg/settings.svg",
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "Profile has to be set up",
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    /// media query
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: sizeWidth >= 640
          ? null
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  label: "home",
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "feeds",
                  icon: Icon(
                    Icons.feed,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "settings",
                  icon: Icon(
                    Icons.settings,
                  ),
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigoAccent,
              onTap: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
      body: Row(
        children: [
          sizeWidth >= 640
              ? NavigationRail(
                  minExtendedWidth: 400,
                  onDestinationSelected: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  leading: const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      FlutterLogo(
                        size: 20,
                      ),
                    ],
                  ),
                  destinations: const [
                    /// home
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: Text(
                        "Home",
                      ),
                    ),

                    /// feeds
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.feed,
                      ),
                      label: Text(
                        "Feeds",
                      ),
                    ),

                    NavigationRailDestination(
                      icon: Icon(
                        Icons.settings,
                      ),
                      label: Text(
                        "settings",
                      ),
                    ),
                  ],
                  selectedIndex: _selectedIndex)
              : const SizedBox(),
          Expanded(
            child: _screen[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
