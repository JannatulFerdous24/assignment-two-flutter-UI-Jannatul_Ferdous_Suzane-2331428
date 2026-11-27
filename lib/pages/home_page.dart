import 'package:flutter/material.dart';

import '../widgets/app_colors.dart';
import '../widgets/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _dates = [9, 10, 11, 12, 13, 14, 15];
  int _selectedDay = 4; // Fri 13

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 24),
            _weekStrip(),
            const SizedBox(height: 24),
            const _StudyGoalCard(),
            const SizedBox(height: 28),
            const SectionHeader(title: 'Due soon', action: 'See all'),
            const SizedBox(height: 14),
            const _DueCard(
              title: 'Lab 6: Navigation and routing',
              subtitle: 'CSE 464 · Today, 11:59 PM',
              priority: Priority.high,
            ),
            const SizedBox(height: 12),
            const _DueCard(
              title: 'ER diagram for library system',
              subtitle: 'CSE 303 · Tomorrow, 5:00 PM',
              priority: Priority.medium,
            ),
            const SizedBox(height: 28),
            const SectionHeader(title: "Today's classes", action: 'Timetable'),
            const SizedBox(height: 14),
            const Row(
              children: [
                Expanded(
                  child: _ClassCard(
                    time: '10:00 AM',
                    course: 'CSE 464',
                    room: 'Room 7012',
                    background: AppColors.primaryLight,
                    accent: AppColors.primaryDark,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ClassCard(
                    time: '1:30 PM',
                    course: 'MAT 212',
                    room: 'Room 3021',
                    background: AppColors.greenSoft,
                    accent: AppColors.greenText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        const InitialsAvatar(initials: StudentInfo.initials, size: 56),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: TextStyle(fontSize: 15, color: AppColors.textGrey),
              ),
              SizedBox(height: 2),
              Text(
                StudentInfo.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SquareIconButton(
          icon: Icons.notifications_none_rounded,
          showDot: true,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _weekStrip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_days.length, (i) {
        final selected = i == _selectedDay;
        return GestureDetector(
          onTap: () => setState(() => _selectedDay = i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              boxShadow: selected
                  ? const [
                      BoxShadow(
                        color: Color(0x402563EB),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              children: [
                Text(
                  _days[i],
                  style: TextStyle(
                    fontSize: 13,
                    color: selected ? Colors.white : AppColors.textLightGrey,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${_dates[i]}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: selected ? Colors.white : AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _StudyGoalCard extends StatelessWidget {
  const _StudyGoalCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark, Color(0xFF1E3A8A)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -60,
              top: -40,
              child: _circle(200, 0.10),
            ),
            Positioned(
              right: 30,
              bottom: -90,
              child: _circle(160, 0.07),
            ),
            const Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TODAY'S STUDY GOAL",
                    style: TextStyle(
                      color: Color(0xCCFFFFFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '2h 15m',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'of 3h',
                        style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  AppProgressBar(
                    value: 0.75,
                    color: Colors.white,
                    trackColor: Color(0x40FFFFFF),
                    height: 7,
                  ),
                  SizedBox(height: 18),
                  Text(
                    '3 tasks due today · 6 day streak',
                    style: TextStyle(color: Color(0xE6FFFFFF), fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}

class _DueCard extends StatelessWidget {
  const _DueCard({
    required this.title,
    required this.subtitle,
    required this.priority,
  });

  final String title;
  final String subtitle;
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 44,
            decoration: BoxDecoration(
              color: priority.accent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: AppColors.textGrey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PriorityBadge(priority: priority),
        ],
      ),
    );
  }
}

class _ClassCard extends StatelessWidget {
  const _ClassCard({
    required this.time,
    required this.course,
    required this.room,
    required this.background,
    required this.accent,
  });

  final String time;
  final String course;
  final String room;
  final Color background;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            course,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            room,
            style: const TextStyle(fontSize: 14, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}
