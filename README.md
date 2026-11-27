# Assignment 2: Flutter UI

**Name:** Jannatul Ferdous Suzane
**Student ID:** 2331428

## Description

**Student Planner** is a Flutter app that recreates a four-screen student planner design. It is built only with Flutter's Material 3 widgets and icons (no external packages). Every screen uses `SafeArea` and `SingleChildScrollView` so it fits on small phones.

## Pages

1. **Home**: greeting with avatar, a week date strip you can tap, a study-goal card with a blue gradient, "Due soon" tasks and today's classes.
2. **Tasks**: search field, tasks grouped by day with checkboxes you can toggle, priority badges and an add button (FAB).
3. **Profile**: avatar, personal details (ID, email, phone, department, semester), preferences with working switches, and a log out button.
4. **Progress**: week selector, stat cards, weekly goal progress, and progress for each course.

## Navigation

The bottom navigation uses a **`PageView` + `PageController`**. `MainScreen` is a `StatefulWidget` that keeps `_currentIndex`. `PageView` uses `NeverScrollableScrollPhysics`, and tapping a `BottomNavigationBar` item calls `setState` and then `_pageController.jumpToPage(i)`. The controller is disposed in `dispose()`.

## Project structure

```
lib/
  main.dart              # App, theme, MainScreen with bottom navigation
  pages/
    home_page.dart
    tasks_page.dart
    profile_page.dart
    progress_page.dart
  widgets/
    app_colors.dart      # Colour palette + student details
    common.dart          # Shared widgets (cards, badges, progress bar, ...)
```

## How to run

```bash
flutter pub get
flutter run
```

To run on a specific Android phone or emulator:

```bash
flutter devices
flutter run -d <device-id>
```
