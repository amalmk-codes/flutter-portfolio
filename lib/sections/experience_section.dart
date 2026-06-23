
import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
            Color(0xFFFFFFFF),
            Color(0xFFF8FAFC),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: SectionTitle(
              text: 'Experience',
            ),
          ),

          const SizedBox(height: 60),

          ...PortfolioData.experiences
              .asMap()
              .entries
              .map(
                (entry) => _buildTimelineCard(
                  entry.value,
                  isLast: entry.key ==
                      PortfolioData
                              .experiences.length -
                          1,
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _buildTimelineCard(
    Experience exp, {
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2563EB),
                        Color(0xFF7C3AED),
                      ],
                    ),
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 4,
                      margin:
                          const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                                20),
                        color:
                            const Color(0xFF2563EB)
                                .withOpacity(0.2),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(
                            0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          exp.position,
                          style:
                              const TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration:
                            BoxDecoration(
                          color:
                              const Color(
                                      0xFF2563EB)
                                  .withOpacity(
                                      0.1),
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),
                        child: Text(
                          exp.duration,
                          style:
                              const TextStyle(
                            color:
                                Color(0xFF2563EB),
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.business,
                        color:
                            Color(0xFF7C3AED),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        exp.company,
                        style:
                            const TextStyle(
                          fontSize: 16,
                          color:
                              Color(0xFF7C3AED),
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    exp.description,
                    style:
                        const TextStyle(
                      fontSize: 15,
                      height: 1.8,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
