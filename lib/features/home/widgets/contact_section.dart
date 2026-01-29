import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/section_title.dart';
import '../../../core/animated_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Theme.of(context).cardColor.withOpacity(0.3),
      child: Column(
        children: [
          const SectionTitle(
            title: "Get In Touch",
            subtitle: "Let's work together",
          ),
          const SizedBox(height: 40),
          const Text(
            "I'm currently looking for new opportunities. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: Icons.email,
                onTap: () => _launchUrl("mailto:omarmedoo94@gmail.com"),
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: Icons
                    .code, // GitHub icon replacement since FontAwesome not used
                onTap: () => _launchUrl("https://github.com/OmarrFarouk97"),
              ),
              const SizedBox(width: 20),
              _SocialButton(
                icon: Icons.work, // LinkedIn icon replacement
                onTap: () => _launchUrl(
                    "https://www.linkedin.com/in/omar-farouk-b82934200/"),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            "© 2024 Omar Farouk. Built with Flutter.",
            style: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).primaryColor),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
