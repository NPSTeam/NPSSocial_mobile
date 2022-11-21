import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nps_social/controllers/conversation_controller.dart';
import 'package:nps_social/controllers/home_controller.dart';
import 'package:nps_social/controllers/notification_controller.dart';
import 'package:nps_social/pages/conversation_page/conversation_page.dart';
import 'package:nps_social/pages/home_page/home_page.dart';
import 'package:nps_social/pages/notification_page/notification_page.dart';
import 'package:nps_social/pages/profile_page/profile_page.dart';
import 'package:nps_social/services/socket_client.dart';
import 'package:nps_social/widgets/widget_bottom_tab_bar.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
  final List<Widget> _screens = [
    const HomePage(),
    const ConversationPage(),
    const Scaffold(),
    const NotificationPage(),
    ProfilePage(),
    // const Scaffold(),
  ];
  final List<IconData> _icons = [
    Ionicons.home_outline,
    Ionicons.chatbubbles_outline,
    Ionicons.people_outline,
    Ionicons.notifications_outline,
    Ionicons.person_outline,
    // Ionicons.menu_outline,
  ];

  int _selectedIndex = 0;

  late TabController _tabController;
  final HomeController _homeController = Get.put(HomeController());
  final ConversationController _conversationController =
      Get.put(ConversationController());
  final NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _icons.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

    // await SocketClient.init();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: _screens,
        ),
        // IndexedStack(
        //   index: _selectedIndex,
        //   children: _screens,
        // ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: WidgetButtonTabBar(
            controller: _tabController,
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
