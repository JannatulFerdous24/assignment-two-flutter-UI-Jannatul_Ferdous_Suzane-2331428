import 'package:flutter/material.dart';

import '../widgets/app_colors.dart';
import '../widgets/common.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _notifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Profile', icon: Icons.settings_outlined),
            const SizedBox(height: 16),
            const Center(
              child: Column(
                children: [
                  InitialsAvatar(initials: StudentInfo.initials, size: 104),
                  SizedBox(height: 16),
                  Text(
                    StudentInfo.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    StudentInfo.id,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const SectionHeader(title: 'Personal details'),
            const SizedBox(height: 12),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: _divided(const [
                  _DetailRow(
                    icon: Icons.badge_outlined,
                    label: 'Student ID',
                    value: StudentInfo.id,
                  ),
                  _DetailRow(
                    icon: Icons.mail_outline,
                    label: 'Email',
                    value: StudentInfo.email,
                  ),
                  _DetailRow(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: StudentInfo.phone,
                  ),
                  _DetailRow(
                    icon: Icons.menu_book_outlined,
                    label: 'Department',
                    value: StudentInfo.department,
                  ),
                  _DetailRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'Semester',
                    value: StudentInfo.semester,
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 28),
            const SectionHeader(title: 'Preferences'),
            const SizedBox(height: 12),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: _divided([
                  _PrefRow(
                    icon: Icons.notifications_none_rounded,
                    label: 'Notifications',
                    trailing: Switch(
                      value: _notifications,
                      activeTrackColor: AppColors.primary,
                      activeThumbColor: Colors.white,
                      onChanged: (v) => setState(() => _notifications = v),
                    ),
                  ),
                  const _PrefRow(
                    icon: Icons.access_time,
                    label: 'Study reminder',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '8:00 PM',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textGrey,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.chevron_right,
                            color: AppColors.textLightGrey),
                      ],
                    ),
                  ),
                  _PrefRow(
                    icon: Icons.dark_mode_outlined,
                    label: 'Dark mode',
                    trailing: Switch(
                      value: _darkMode,
                      activeTrackColor: AppColors.primary,
                      activeThumbColor: Colors.white,
                      inactiveTrackColor: AppColors.track,
                      inactiveThumbColor: Colors.white,
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      onChanged: (v) => setState(() => _darkMode = v),
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Logged out')),
                    );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.redText,
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _divided(List<Widget> rows) {
    final out = <Widget>[];
    for (var i = 0; i < rows.length; i++) {
      if (i > 0) out.add(const Divider(height: 1, color: AppColors.border));
      out.add(rows[i]);
    }
    return out;
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconBox(
            icon: icon,
            background: AppColors.primaryLight,
            color: AppColors.primary,
          ),
          const SizedBox(width: 14),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrefRow extends StatelessWidget {
  const _PrefRow({
    required this.icon,
    required this.label,
    required this.trailing,
  });

  final IconData icon;
  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          IconBox(
            icon: icon,
            background: AppColors.primaryLight,
            color: AppColors.primary,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
