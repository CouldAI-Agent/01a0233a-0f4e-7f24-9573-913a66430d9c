import 'package:flutter/material.dart';

void main() {
  runApp(const StoryboardApp());
}

class StoryboardApp extends StatelessWidget {
  const StoryboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ఎమోషనల్ స్టోరీ (Emotional Story)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Dark slate/night blue
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF38BDF8),
          surface: Color(0xFF1E293B),
        ),
        fontFamily: 'Roboto', // Fallback, Telugu text will use system default fonts usually which is fine
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StoryScreen(),
      },
    );
  }
}

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> scenes = [
      {
        'time': '0–8 sec',
        'context': 'వర్షం పడుతున్న రాత్రి. ఒక చిన్న అబ్బాయి ఇంటి ముందు కూర్చొని నాన్న కోసం ఎదురుచూస్తుంటాడు.',
        'dialogue': 'అబ్బాయి: "నాన్న ఇంకా రాలేదే…"',
        'icon': 'nightlight_round',
      },
      {
        'time': '8–18 sec',
        'context': 'అమ్మ నిశ్శబ్దంగా అబ్బాయి దగ్గరకు వచ్చి, నాన్న ఫోన్‌ను అతని చేతిలో పెడుతుంది.',
        'dialogue': 'అబ్బాయి ఫోన్ చూస్తూ: "నాన్న నన్ను ఎప్పుడు తీసుకెళ్తావు అన్నావు కదా…"',
        'icon': 'phone_android',
      },
      {
        'time': '18–28 sec',
        'context': 'అమ్మ కన్నీళ్లు ఆపుకుంటూ చెబుతుంది:',
        'dialogue': 'అమ్మ: "నాన్న ఇక మన దగ్గరకు రారు బాబు…"\n\nఅబ్బాయి ఒక్కసారిగా నిశ్శబ్దమైపోతాడు.',
        'icon': 'water_drop',
      },
      {
        'time': '28–36 sec',
        'context': 'అతను నాన్న ఫోటోను గట్టిగా పట్టుకుని:',
        'dialogue': 'అబ్బాయి: "నాన్నా… ఒక్కసారి అయినా ‘బాబు’ అని పిలువు…"',
        'icon': 'portrait',
      },
      {
        'time': '36–40 sec',
        'context': 'కెమెరా నెమ్మదిగా వెనక్కి వెళ్తుంది. వర్షం శబ్దం మాత్రమే వినిపిస్తుంది.',
        'dialogue': 'On-screen text:\n"కొన్ని స్వరాలు… జీవితంలో ఒక్కసారి మౌనమైతే, మళ్లీ వినిపించవు." 💔',
        'icon': 'videocam',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'కన్నీటి జ్ఞాపకం',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF000000),
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: scenes.length,
          itemBuilder: (context, index) {
            final scene = scenes[index];
            return SceneCard(
              time: scene['time']!,
              contextText: scene['context']!,
              dialogue: scene['dialogue']!,
              iconName: scene['icon']!,
              isLast: index == scenes.length - 1,
            );
          },
        ),
      ),
    );
  }
}

class SceneCard extends StatelessWidget {
  final String time;
  final String contextText;
  final String dialogue;
  final String iconName;
  final bool isLast;

  const SceneCard({
    super.key,
    required this.time,
    required this.contextText,
    required this.dialogue,
    required this.iconName,
    this.isLast = false,
  });

  IconData _getIcon(String name) {
    switch (name) {
      case 'nightlight_round':
        return Icons.nightlight_round;
      case 'phone_android':
        return Icons.phone_android;
      case 'water_drop':
        return Icons.water_drop;
      case 'portrait':
        return Icons.portrait;
      case 'videocam':
        return Icons.videocam;
      default:
        return Icons.movie;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getIcon(iconName),
                      size: 16,
                      color: const Color(0xFF94A3B8),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B).withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isLast ? const Color(0xFF38BDF8).withOpacity(0.3) : Colors.transparent,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contextText,
                  style: const TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                  ),
                  child: Text(
                    dialogue,
                    style: TextStyle(
                      color: isLast ? const Color(0xFFE2E8F0) : Colors.white,
                      fontSize: 18,
                      fontWeight: isLast ? FontWeight.bold : FontWeight.w500,
                      height: 1.6,
                      fontStyle: isLast ? FontStyle.italic : FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
