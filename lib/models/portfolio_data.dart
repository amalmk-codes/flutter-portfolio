// models/portfolio_data.dart
class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String imageLabel;
  final String githubUrl;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageLabel,
    required this.githubUrl,
  });
}


class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;

  const Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
  });
}

class Skill {
  final String name;
  final String category;

  const Skill({
    required this.name,
    required this.category,
  });
}

class PortfolioData {
  // Personal Info
  static const String name = 'Amal M K';

  static const String title =
      'B.Tech CSE Student | Flutter Developer | MERN Stack Learner';

  static const String intro =
      'Passionate Computer Science student building mobile and web applications using Flutter, MERN Stack, and modern technologies.';

  static const String aboutMe =
      "Hi! I'm Amal M K, a B.Tech Computer Science and Engineering student at Vidya Academy of Science and Technology, Thrissur. "
      "I am passionate about software development, Flutter, web development, cybersecurity, and open-source technologies. "
      "I enjoy building real-world projects, completing internships, and continuously improving my technical skills. "
      "My goal is to become a Full Stack Developer and create impactful software solutions.";

  // Education
  static const String degree =
      'B.Tech Computer Science and Engineering';

  static const String university =
      'Vidya Academy of Science and Technology (KTU)';

  static const String graduationYear = '2028';

  // Contact
  static const String email =
      'amalmkcoder@gmail.com';

  static const String phone =
      '+91 XXXXXXXXXX';

  static const String linkedin =
      'https://www.linkedin.com/in/amal-m-k-667b6b386/';

  static const String github =
      'https://github.com/amalmk-codes';

  // Skills
  static const List<Skill> skills = [
    Skill(name: 'Flutter', category: 'Mobile'),
    Skill(name: 'Dart', category: 'Mobile'),
    Skill(name: 'React', category: 'Web'),
    Skill(name: 'Node.js', category: 'Backend'),
    Skill(name: 'MongoDB', category: 'Database'),
    Skill(name: 'Firebase', category: 'Backend'),
    Skill(name: 'HTML', category: 'Web'),
    Skill(name: 'CSS', category: 'Web'),
    Skill(name: 'JavaScript', category: 'Web'),
    Skill(name: 'Python', category: 'Programming'),
    Skill(name: 'Java', category: 'Programming'),
    Skill(name: 'C', category: 'Programming'),
    Skill(name: 'Git & GitHub', category: 'Tools'),
    Skill(name: 'Cybersecurity', category: 'Security'),
  ];

  // Projects
  static const List<Project> projects = [
  Project(
    title: 'Phishing Email Detector',
    description:
        'Cybersecurity project that analyzes emails and identifies phishing attacks.',
    technologies: ['Python', 'Cybersecurity'],
    imageLabel: 'Phishing Detector',
    githubUrl:
        'https://github.com/amalmk-codes/phishing_email_detector',
  ),

  Project(
    title: 'Secure Login System',
    description:
        'Authentication system implementing secure login and user verification.',
    technologies: ['Python', 'Security'],
    imageLabel: 'Secure Login',
    githubUrl:
        'https://github.com/amalmk-codes/Secure_login_system',
  ),

  Project(
    title: 'Vulnerability Scanner',
    description:
        'Tool for identifying common vulnerabilities in websites and systems.',
    technologies: ['HTML', 'Cybersecurity'],
    imageLabel: 'Scanner',
    githubUrl:
        'https://github.com/amalmk-codes/vulnerability-scanner',
  ),

  Project(
    title: 'E-Commerce Store',
    description:
        'Online shopping platform developed during CodeAlpha internship.',
    technologies: ['JavaScript', 'HTML', 'CSS'],
    imageLabel: 'E-Commerce',
    githubUrl:
        'https://github.com/amalmk-codes/CodeAlpha_EcommerceStore',
  ),

  Project(
    title: 'Smart Calculator',
    description:
        'Modern calculator with a clean user interface.',
    technologies: ['HTML', 'CSS', 'JavaScript'],
    imageLabel: 'Calculator',
    githubUrl:
        'https://github.com/amalmk-codes/smart-calculator',
  ),

  Project(
    title: 'Environmental Education Website',
    description:
        'Interactive educational platform with quizzes and activities.',
    technologies: ['HTML', 'CSS', 'JavaScript'],
    imageLabel: 'Environment',
    githubUrl:
        'https://github.com/amalmk-codes/module2',
  ),
];

  // Experience
  static const List<Experience> experiences = [
    Experience(
      company: 'Cisco Networking Academy',
      position: 'Cybersecurity Intern',
      duration: '2026',
      description:
          'Completed hands-on cybersecurity and networking training programs, gaining practical knowledge of network security, cyber threats, and industry best practices.',
    ),

    Experience(
      company: 'PaceLab',
      position: 'Software Development Intern',
      duration: '2026',
      description:
          'Worked on project-based learning activities and software development tasks while improving programming and problem-solving skills.',
    ),

    Experience(
      company: 'CodeAlpha',
      position: 'Web Development Intern',
      duration: '2026',
      description:
          'Developed web applications and completed internship projects using HTML, CSS, JavaScript, and modern web development techniques.',
    ),

    Experience(
      company: 'Thiranex',
      position: 'Full Stack Development Intern',
      duration: '2026',
      description:
          'Built full-stack web applications and gained practical experience in frontend development, backend integration, databases, and deployment workflows.',
    ),
  ];
}

