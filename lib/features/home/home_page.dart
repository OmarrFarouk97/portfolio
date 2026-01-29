import 'package:portfolio/core/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/home/widgets/about_section.dart';
import 'package:portfolio/features/home/widgets/contact_section.dart';
import 'package:portfolio/features/home/widgets/navbar.dart';
import 'package:portfolio/features/home/widgets/projects_section.dart';
import 'package:portfolio/features/home/widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(
              aboutKey: aboutKey,
              skillsKey: skillsKey,
              projectsKey: projectsKey,
              contactKey: contactKey,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: AboutSection(sectionKey: aboutKey),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: SkillsSection(key: skillsKey),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: ProjectsSection(key: projectsKey),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: ContactSection(key: contactKey),
            ),
          ],
        ),
      ),
    );
  }
}
