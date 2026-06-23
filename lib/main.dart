import 'package:flutter/material.dart';

import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amal M K Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),

        scaffoldBackgroundColor: Colors.white,

        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() =>
      _PortfolioPageState();
}

class _PortfolioPageState
    extends State<PortfolioPage> {
  final ScrollController _scrollController =
      ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];

    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration:
            const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop =
        MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      drawer: isDesktop
          ? null
          : Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Center(
                      child: Text(
                        'Amal M K',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  _drawerItem(
                    "About",
                    () =>
                        _scrollToSection('about'),
                  ),
                  _drawerItem(
                    "Projects",
                    () => _scrollToSection(
                        'projects'),
                  ),
                  _drawerItem(
                    "Experience",
                    () => _scrollToSection(
                        'experience'),
                  ),
                  _drawerItem(
                    "Contact",
                    () => _scrollToSection(
                        'contact'),
                  ),
                ],
              ),
            ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,

        title: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.all(8),
              decoration:
                  const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2563EB),
                    Color(0xFF7C3AED),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.code,
                color: Colors.white,
                size: 18,
              ),
            ),

            const SizedBox(width: 12),

            const Text(
              "Amal M K",
              style: TextStyle(
                fontWeight:
                    FontWeight.bold,
                color:
                    Color(0xFF111827),
              ),
            ),
          ],
        ),

        actions: isDesktop
            ? [
                _NavButton(
                  label: "About",
                  onTap: () =>
                      _scrollToSection(
                          'about'),
                ),
                _NavButton(
                  label: "Projects",
                  onTap: () =>
                      _scrollToSection(
                          'projects'),
                ),
                _NavButton(
                  label: "Experience",
                  onTap: () =>
                      _scrollToSection(
                          'experience'),
                ),
                _NavButton(
                  label: "Contact",
                  onTap: () =>
                      _scrollToSection(
                          'contact'),
                ),
                const SizedBox(width: 20),
              ]
            : null,
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              sectionKeys: _sectionKeys,
            ),

            Container(
              key: _sectionKeys['about'],
              child: const AboutSection(),
            ),

            Container(
              key: _sectionKeys['projects'],
              child: const ProjectsSection(),
            ),

            Container(
              key:
                  _sectionKeys['experience'],
              child:
                  const ExperienceSection(),
            ),

            Container(
              key: _sectionKeys['contact'],
              child: const ContactSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 20,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF374151),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
