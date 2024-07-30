import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jack,',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text(
              'You have work today',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryCard(title: 'Today', count: '6', color: Colors.blue),
                SummaryCard(title: 'Scheduled', count: '5', color: Colors.yellow),
                SummaryCard(title: 'All', count: '14', color: Colors.green),
                SummaryCard(title: 'Overdue', count: '3', color: Colors.red),
              ],
            ),
            SizedBox(height: 16),
            // Today's Tasks
            Text(
              "Today's Task",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(child: TaskList())
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TaskCard(
          time: '4:50 PM',
          task: 'Project retrospective',
          isToday: true,
        ),
        TaskCard(
          time: '4:50 PM',
          task: 'Evening team meeting',
          isToday: true,
        ),
        TaskCard(
          time: '4:50 PM',
          task: 'Create monthly deck',
          isToday: true,
        ),
        TaskCard(
          time: '6:00 PM',
          task: 'Shop for groceries',
          isToday: true,
          subtasks: ['Pick up bag', 'Rice', 'Meat'],
        ),
        TaskCard(
          time: '10:30 PM',
          task: 'Read book',
          isToday: false,
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String time;
  final String task;
  final bool isToday;
  final List<String>? subtasks;

  const TaskCard({
    super.key,
    required this.time,
    required this.task,
    required this.isToday,
    this.subtasks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.circle, color: isToday ? Colors.blue : Colors.grey, size: 12),
                const SizedBox(width: 8),
                Text('Today $time'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              task,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (subtasks != null) ...[
              const SizedBox(height: 8),
              ...subtasks!.map((subtask) => Text('- $subtask')),
            ],
          ],
        ),
      ),
    );
  }
}
