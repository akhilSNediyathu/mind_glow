import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mind_glow/utils/colo_extension.dart';
import 'package:mind_glow/view/home/screen_home.dart';
import 'package:mind_glow/view/mood_tracker/screen_mood_tracker.dart';
import 'package:mind_glow/view/profile/screen_profile.dart';
import 'package:mind_glow/view/resourses/screen_resources.dart';
import 'package:mind_glow/view/wellness_planner/screen_wellness_planner.dart';

// ValueNotifier to keep track of the current page index
final ValueNotifier<int> currentPage = ValueNotifier(0);

// A persistent GlobalKey for the navigation bar
final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  // List of pages corresponding to the bottom navigation
  final List<Widget> _pages = [
    const ScreenHome(),
    const ScreenMoodTracker(),
    const ScreenWellnessPlanner(),
    const ScreenResources(),
    const ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, value, child) {
          return CurvedNavigationBar(
            key: _bottomNavigationKey, 
            backgroundColor: Tcolo.Primarycolor1,

            items: const <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.mood, size: 30),
              Icon(Icons.favorite, size: 30),
              Icon(Icons.library_books, size: 30),
              Icon(Icons.people, size: 30),
            ],
            index: value,
            onTap: (index) {
              // Update the ValueNotifier with the new page index
              currentPage.value = index;
            },
          );
        },
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, value, child) {
          // Display the selected page from the list
          return _pages[value];
        },
      ),
    );
  }
}
