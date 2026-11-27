import 'package:flutter/material.dart';

import '../widgets/app_colors.dart';
import '../widgets/common.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Progress',
              icon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 18),
            _weekSelector(),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.access_time,
                    iconBackground: AppColors.primaryLight,
                    iconColor: AppColors.primary,
                    value: '9h 21m',
                    label: 'Studied',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    icon: Icons.check_box_outlined,
                    iconBackground: AppColors.greenLight,
                    iconColor: AppColors.greenText,
                    value: '14',
                    label: 'Tasks done',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    icon: Icons.local_fire_department_outlined,
                    iconBackground: AppColors.amberLight,
                    iconColor: AppColors.amberText,
                    value: '6 days',
                    label: 'Streak',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _weekCard(),
            const SizedBox(height: 28),
            const SectionHeader(title: 'Courses', action: 'Manage'),
            const SizedBox(height: 14),
            const _CourseCard(
              code: '464',
              title: 'CSE 464 · Mobile Dev',
              next: 'Next: Lab 6, today',
              percent: 0.72,
              color: AppColors.primary,
              textColor: AppColors.primaryDark,
              light: AppColors.primaryLight,
            ),
            const SizedBox(height: 12),
            const _CourseCard(
              code: '303',
              title: 'CSE 303 · Databases',
              next: 'Next: ER diagram, Sat',
              percent: 0.58,
              color: AppColors.amber,
              textColor: AppColors.amberText,
              light: AppColors.amberLight,
            ),
            const SizedBox(height: 12),
            const _CourseCard(
              code: '212',
              title: 'MAT 212 · Linear Algebra',
              next: 'Next: Problem set 4, Mon',
              percent: 0.84,
              color: AppColors.green,
              textColor: AppColors.greenText,
              light: AppColors.greenLight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _weekSelector() {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left, color: AppColors.textGrey),
          ),
          const Expanded(
            child: Text(
              'This week · 9 to 15 Nov',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }

  Widget _weekCard() {
    return AppCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'This week',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              Text(
                '78%',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            '9h 21m of 12h goal',
            style: TextStyle(fontSize: 15, color: AppColors.textGrey),
          ),
          const SizedBox(height: 18),
          const AppProgressBar(value: 0.78),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.greenLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.trending_up, size: 16, color: AppColors.greenText),
                SizedBox(width: 6),
                Text(
                  '+18% vs last week',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.code,
    required this.title,
    required this.next,
    required this.percent,
    required this.color,
    required this.textColor,
    required this.light,
  });

  final String code;
  final String title;
  final String next;
  final double percent;
  final Color color;
  final Color textColor;
  final Color light;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: light,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              code,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${(percent * 100).round()}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  next,
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.textGrey),
                ),
                const SizedBox(height: 12),
                AppProgressBar(value: percent, color: color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
