import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Experience", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ExperienceItem(
            title: "Flutter Developer - UE Technology",
            date: "2025 - Present",
          ),
          ExperienceItem(
            title: "Flutter Developer - Ahmed Ashour Group",
            date: "2025",
          ),
          ExperienceItem(
            title: "Flutter Developer - GreenMEA",
            date: "2023",
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String date;

  const ExperienceItem({required this.title, required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
          const SizedBox(width: 15),
          Text("$title  ($date)", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
