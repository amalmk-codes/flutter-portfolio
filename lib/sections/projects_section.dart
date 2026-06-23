
import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width =
        MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1000;
    final bool isTablet =
        width >= 600 && width < 1000;

    double cardWidth;

    if (isDesktop) {
      cardWidth = (width - 220) / 3;
    } else if (isTablet) {
      cardWidth = (width - 140) / 2;
    } else {
      cardWidth = width - 48;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF8FAFC),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Center(
            child: SectionTitle(
              text: 'Projects',
            ),
          ),

          const SizedBox(height: 16),

          const Center(
            child: Text(
              'Some of my recent projects and development work',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),

          const SizedBox(height: 50),

          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children:
                  PortfolioData.projects.map((project) {
                return SizedBox(
                  width: cardWidth,
                  child: ProjectCard(
                    project: project,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
