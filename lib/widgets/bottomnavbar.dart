import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  int _selectedTabIndex = 0;

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  Widget _tabItem(Widget child, {bool isSelected = false}) {
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.center,
      margin: EdgeInsets.all(pageHeight * 0.008),
      padding: EdgeInsets.all(pageWidth * 0.0175),
      decoration: !isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff84AEA4),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(20 ),
              color: const Color(0xffF1FAF8),
            ),
      child: child,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _icons = [
      Image.asset("assets/Predict.png"),
      Image.asset("assets/Monitor.png"),
      Image.asset("assets/FAQ.png"),
    ];
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;

    return Container(
      height: pageHeight * 0.0875,
      padding: EdgeInsets.only(
        left: pageWidth * 0.18,
        right: pageWidth * 0.18,
        bottom: pageHeight * 0.015,
        top: pageHeight * 0.0075,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          color: const Color(0xff133B33),
          child: TabBar(
            onTap: (value) {
              setState(() {
                _selectedTabIndex = value;
              });
            },
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide.none,
            ),
            tabs: [
              for (int i = 0; i < _icons.length; i++)
                _tabItem(
                  _icons[i],
                  isSelected: i == _selectedTabIndex,
                ),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
