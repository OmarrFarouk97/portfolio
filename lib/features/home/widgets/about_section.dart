import 'package:flutter/material.dart';
import '../../../widgets/section_title.dart';
import '../../../core/animated_widgets.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      key: sectionKey,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 80,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfileImage(context, isMobile),
                const SizedBox(height: 40),
                _buildTextContent(context, true),
                const SizedBox(height: 40),
                _buildInfoCard(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildProfileImage(context, isMobile)),
                const SizedBox(width: 80),
                Expanded(
                  flex: 3, // Give more space to text on desktop
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextContent(context, false),
                      const SizedBox(height: 40),
                      _buildInfoCard(context),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildProfileImage(BuildContext context, bool isMobile) {
    return HoverScale(
      scale: 1.05,
      child: Container(
        width: isMobile ? 250 : 350,
        height: isMobile ? 250 : 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
          image: const DecorationImage(
            image: AssetImage("assets/images/profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool centered) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: "About Me",
          subtitle: "Getting to know me",
        ),
        const SizedBox(height: 30),
        RichText(
          textAlign: centered ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  fontSize: 18,
                ),
            children: [
              const TextSpan(text: "Hi there! I'm "),
              const TextSpan(
                text:
                    "dedicated Flutter developer with a passion for crafting beautiful and functional mobile applications. "
                    "With 2 years of experience in the field, I've honed my skills in creating responsive and intuitive user interfaces that delight users.\n\n"
                    "My expertise lies in leveraging the power of Flutter to build cross-platform applications that run seamlessly on both iOS and Android devices. "
                    "From designing pixel-perfect UIs to implementing complex functionality, I thrive on turning ideas into reality through clean and maintainable code.",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          InfoRow(title: "Name", value: "Omar Mohamed Farouk"),
          InfoRow(title: "Role", value: "Flutter Developer"),
          InfoRow(title: "Experience", value: "+2 Years"),
          InfoRow(title: "Location", value: "Cairo, Maadi"),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
