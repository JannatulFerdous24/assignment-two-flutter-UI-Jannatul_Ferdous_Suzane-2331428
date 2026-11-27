import 'package:flutter/material.dart';

import '../widgets/app_colors.dart';
import '../widgets/common.dart';

class _Task {
  _Task(this.title, this.course, this.time, this.priority,
      {this.done = false, this.urgent = false});

  final String title;
  final String course;
  final String time;
  final Priority priority;
  final bool urgent;
  bool done;
}

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<_Task> _today = [
    _Task('Lab 6: Navigation and routing', 'CSE 464', '11:59 PM',
        Priority.high,
        urgent: true),
    _Task('Read chapter 7: Normalization', 'CSE 303', '6:00 PM',
        Priority.medium),
    _Task('Submit quiz 3 reflection', 'MAT 212', '2:00 PM', Priority.low,
        done: true),
  ];

  final List<_Task> _tomorrow = [
    _Task('ER diagram for library system', 'CSE 303', '5:00 PM',
        Priority.medium),
    _Task('Watch lecture 9', 'CSE 464', '8:00 PM', Priority.low),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Add new task coming soon')),
            );
        },
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: const Icon(Icons.add, size: 30),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Tasks',
                icon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 20),
              _searchField(),
              const SizedBox(height: 26),
              _groupHeader('TODAY · FRI, 13 NOV', _today.length),
              const SizedBox(height: 12),
              ..._today.map(_taskCard),
              const SizedBox(height: 14),
              _groupHeader('TOMORROW · SAT, 14 NOV', _tomorrow.length),
              const SizedBox(height: 12),
              ..._tomorrow.map(_taskCard),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search tasks, courses...',
        hintStyle: const TextStyle(color: AppColors.textLightGrey),
        prefixIcon: const Icon(Icons.search, color: AppColors.textLightGrey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _groupHeader(String label, int count) {
    const style = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    );
    return Row(
      children: [
        Expanded(
          child: Text(label, style: style.copyWith(color: AppColors.textGrey)),
        ),
        Text('$count TASKS', style: style.copyWith(color: AppColors.primary)),
      ],
    );
  }

  Widget _taskCard(_Task task) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.25,
              child: Checkbox(
                value: task.done,
                onChanged: (v) => setState(() => task.done = v ?? false),
                activeColor: AppColors.primary,
                side: const BorderSide(color: Color(0xFFCBD5E1), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: task.done
                          ? AppColors.textLightGrey
                          : AppColors.textDark,
                      decoration:
                          task.done ? TextDecoration.lineThrough : null,
                      decorationColor: AppColors.textLightGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textGrey,
                      ),
                      children: [
                        TextSpan(text: '${task.course} · '),
                        TextSpan(
                          text: task.time,
                          style: TextStyle(
                            color: task.urgent && !task.done
                                ? AppColors.redText
                                : AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            PriorityBadge(priority: task.priority),
          ],
        ),
      ),
    );
  }
}
