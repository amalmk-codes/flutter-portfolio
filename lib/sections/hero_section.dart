
import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;

  const HeroSection({
    super.key,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth >= 800;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFC),
            Color(0xFFE0EAFF),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: isDesktop
          ? _buildDesktopLayout(context)
          : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: Center(
            child: _buildAvatar(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildAvatar(),
        const SizedBox(height: 40),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const CircleAvatar(
        radius: 120,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(
          'https://media.licdn.com/dms/image/v2/D5603AQH_YWVmZ0NtJA/profile-displayphoto-crop_800_800/B56ZxYHv7bGcAM-/0/1771004957712?e=1783555200&v=beta&t=BbuCCZYh75p8glGNsNf2I7n5qsSW9Gui19La1ke74TE',
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '👋 Welcome to My Portfolio',
            style: TextStyle(
              color: Color(0xFF2563EB),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text(
          PortfolioData.name,
          style: const TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          PortfolioData.title,
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xFF2563EB),
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          PortfolioData.intro,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 40),

        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _scrollToSection('projects'),
              icon: const Icon(Icons.work_outline),
              label: const Text('View Projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            OutlinedButton.icon(
              onPressed: () => _scrollToSection('contact'),
              icon: const Icon(Icons.mail_outline),
              label: const Text('Contact Me'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                side: const BorderSide(
                  color: Color(0xFF2563EB),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _scrollToSection(String key) {
    final globalKey = sectionKeys[key];

    if (globalKey?.currentContext != null) {
      Scrollable.ensureVisible(
        globalKey!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}

