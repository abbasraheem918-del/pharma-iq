
import 'package:flutter/material.dart';

void main() {
  runApp(const PharmaIQ());
}

class PharmaIQ extends StatelessWidget {
  const PharmaIQ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharma IQ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pharma IQ'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const Text(
              'مساعدك الصيدلاني الذكي',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'منصة تعليمية للصيادلة وطلاب الصيدلة',
            ),
            const SizedBox(height: 24),
            FeatureCard(
              icon: Icons.quiz,
              title: 'الاختبارات الصيدلانية',
              subtitle: 'اختبر معلوماتك وتعلم من أخطائك',
              page: const QuizPage(),
            ),
            FeatureCard(
              icon: Icons.medication,
              title: 'دليل الأدوية',
              subtitle: 'معلومات عن الأدوية وتصنيفاتها',
              page: const InfoPage(
                title: 'دليل الأدوية',
                message: 'سيتم إضافة قاعدة بيانات دوائية موثوقة.',
              ),
            ),
            FeatureCard(
              icon: Icons.compare_arrows,
              title: 'التداخلات الدوائية',
              subtitle: 'تعرف على التداخلات والتحذيرات',
              page: const InfoPage(
                title: 'التداخلات الدوائية',
                message: 'سيتم ربط هذا القسم بمراجع علمية موثوقة.',
              ),
            ),
            FeatureCard(
              icon: Icons.lightbulb,
              title: 'نصائح صيدلانية',
              subtitle: 'معلومات مهمة من واقع الصيدلية',
              page: const InfoPage(
                title: 'نصائح صيدلانية',
                message: 'تحقق دائماً من الحساسية والأدوية الحالية قبل الصرف.',
              ),
            ),
            FeatureCard(
              icon: Icons.newspaper,
              title: 'التحديثات الطبية',
              subtitle: 'آخر الأخبار والتنبيهات الطبية',
              page: const InfoPage(
                title: 'التحديثات الطبية',
                message: 'سيتم إضافة تحديثات بمصادر وتواريخ موثوقة.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget page;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_left),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int? selected;

  final question =
      'أي دواء قد يزيد خطر النزف عند استخدامه مع Warfarin؟';

  final answers = [
    'Ibuprofen',
    'Loratadine',
    'Vitamin C',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('اختبار صيدلاني')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(
                answers.length,
                (i) => Card(
                  child: RadioListTile<int>(
                    value: i,
                    groupValue: selected,
                    title: Text(answers[i]),
                    onChanged: (value) {
                      setState(() => selected = value);
                    },
                  ),
                ),
              ),
              if (selected != null)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    selected == 0
                        ? 'إجابة صحيحة. Ibuprofen قد يزيد خطر النزف مع Warfarin.'
                        : 'الإجابة الصحيحة هي Ibuprofen. قد يزيد خطر النزف.',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  final String title;
  final String message;

  const InfoPage({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              message,
              style: const TextStyle(fontSize: 19),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
