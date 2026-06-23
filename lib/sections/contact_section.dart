// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop =
        MediaQuery.of(context).size.width >= 800;

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
            Color(0xFFEFF6FF),
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(text: 'Contact Me'),

          const SizedBox(height: 20),

          const Text(
            "I'm always open to discussing internships, projects, freelance work, collaborations, and new opportunities.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 50),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _contactCard(
                icon: Icons.email_outlined,
                title: 'Email',
                value: PortfolioData.email,
                onTap: () => _launchUrl(
                  'mailto:${PortfolioData.email}',
                ),
              ),

              _contactCard(
                icon: Icons.work_outline,
                title: 'LinkedIn',
                value: 'Connect with me',
                onTap: () => _launchUrl(
                  PortfolioData.linkedin,
                ),
              ),

              _contactCard(
                icon: Icons.code,
                title: 'GitHub',
                value: 'View my repositories',
                onTap: () => _launchUrl(
                  PortfolioData.github,
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          Container(
            width: double.infinity,
            constraints:
                const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2563EB),
                  Color(0xFF7C3AED),
                ],
              ),
              borderRadius:
                  BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "Let's Build Something Amazing Together 🚀",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Feel free to reach out for internships, collaborations, development projects, or technology discussions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.7,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: () => _launchUrl(
                    'mailto:${PortfolioData.email}'
                    '?subject=Portfolio Contact'
                    '&body=Hello Amal,%0D%0A%0D%0AI would like to connect with you.',
                  ),
                  icon:
                      const Icon(Icons.send_rounded),
                  label: const Text(
                    'Send Email',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white,
                    foregroundColor:
                        const Color(0xFF2563EB),
                    elevation: 5,
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 18,
                    ),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              14),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          const Divider(),

          const SizedBox(height: 20),

          Text(
            '© ${DateTime.now().year} Amal M K • Built with Flutter Web',
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor:
                  const Color(0xFF2563EB)
                      .withOpacity(0.1),
              child: Icon(
                icon,
                color:
                    const Color(0xFF2563EB),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _launchUrl(String url) {
    html.window.open(url, '_blank');
  }
}