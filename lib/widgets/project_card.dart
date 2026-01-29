import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/animated_widgets.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techs;
  final String? googlePlay;
  final String? appStore;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techs,
    this.googlePlay,
    this.appStore,
  });

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      scale: 1.02,
      child: Container(
        width: 350,
        height: 380, // Fixed height for consistency
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.folder_open_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
                Row(
                  children: [
                    if (googlePlay != null)
                      IconButton(
                        onPressed: () => openLink(googlePlay!),
                        icon: const Icon(Icons.android, size: 20),
                        tooltip: "Google Play",
                        color: Colors.grey,
                      ),
                    if (appStore != null)
                      IconButton(
                        onPressed: () => openLink(appStore!),
                        icon: const Icon(Icons.apple, size: 22),
                        tooltip: "App Store",
                        color: Colors.grey,
                      ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),

            // Description
            Expanded(
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 1.5),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20),

            // Tech Stack
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: techs
                  .map(
                    (t) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        t,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
