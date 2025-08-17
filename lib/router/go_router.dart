import 'package:chat_app/Screens/chat_list.dart';
import 'package:chat_app/Screens/home.dart';
import 'package:chat_app/Screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _chatNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final bottomNavRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute(
      
      navigatorContainerBuilder: (
        BuildContext context,
        StatefulNavigationShell navigationShell,
        List<Widget> children,
      ) {
        return IndexedStack(
          index: navigationShell.currentIndex,
          children: children,
        );
      },
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) => navigationShell.goBranch(index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _chatNavigatorKey,
          routes: [
            GoRoute(
              path: '/chat',
              builder: (context, state) => const ChatList(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
