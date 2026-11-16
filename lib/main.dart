
import 'package:flutter/material.dart';

void main() {
  runApp(const LexiCardsApp());
}

class LexiCardsApp extends StatelessWidget {
  const LexiCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LexiCards',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF9F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE99A56),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Word>? selectedStudyWords;
  bool showTranslation = false;

  final List<String> titles = [
    'Словарь',
    'Колоды',
    'Карточки',
    'Статистика',
    'Профиль',
  ];

  final List<IconData> icons = [
    Icons.menu_book_rounded,
    Icons.layers_rounded,
    Icons.style_rounded,
    Icons.bar_chart_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LexiCards',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF694832),
          ),
        ),
        backgroundColor: const Color(0xFFFFF9F2),
      ),


      body: selectedIndex == 0
          ? const DictionaryScreen()
          : selectedIndex == 1
          ? DecksScreen(
              onStartStudy: (studyWords) {
                setState(() {
                  selectedStudyWords = studyWords;
                  selectedIndex = 2;
                });
              },
            )
          : selectedIndex == 2
          ? StudyScreen(
              studyWords: selectedStudyWords ?? words,
            )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons[selectedIndex],
              size: 64,
              color: const Color(0xFFE99A56),
            ),
            const SizedBox(height: 16),
            Text(
              titles[selectedIndex],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF694832),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Добро пожаловать в LexiCards!',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF806D5D),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: [
          for (int i = 0; i < titles.length; i++)
            NavigationDestination(
              icon: Icon(icons[i]),
              label: titles[i],
            ),
        ],
      ),
    );
  }
}

class Word {
  final String english;
  final String transcription;
  final String translation;
  final String example;
  final String exampleTranslation;

  const Word({
    required this.english,
    required this.transcription,
    required this.translation,
    required this.example,
    required this.exampleTranslation,
  });
}

const List<Word> words = [
  Word(
    english: 'beautiful',
    transcription: '/ˈbjuːtɪfəl/',
    translation: 'красивый, прекрасный',
    example: 'She has a beautiful smile.',
    exampleTranslation: 'У неё красивая улыбка.',
  ),
  Word(
    english: 'brave',
    transcription: '/breɪv/',
    translation: 'смелый, храбрый',
    example: 'He is a brave person.',
    exampleTranslation: 'Он смелый человек.',
  ),
  Word(
    english: 'deep',
    transcription: '/diːp/',
    translation: 'глубокий',
    example: 'He has deep feelings.',
    exampleTranslation: 'У него глубокие чувства.',
  ),
  Word(
    english: 'love',
    transcription: '/lʌv/',
    translation: 'любовь; любить',
    example: 'Love makes us stronger.',
    exampleTranslation: 'Любовь делает нас сильнее.',
  ),
  Word(
    english: 'travel',
    transcription: '/ˈtrævəl/',
    translation: 'путешествовать; путешествие',
    example: 'I love to travel.',
    exampleTranslation: 'Я люблю путешествовать.',
  ),
  Word(
    english: 'airport',
    transcription: '/ˈeəpɔːt/',
    translation: 'аэропорт',
    example: 'We arrived at the airport early.',
    exampleTranslation: 'Мы приехали в аэропорт рано.',
  ),
  Word(
    english: 'ticket',
    transcription: '/ˈtɪkɪt/',
    translation: 'билет',
    example: 'I bought a plane ticket.',
    exampleTranslation: 'Я купила билет на самолёт.',
  ),
  Word(
    english: 'business',
    transcription: '/ˈbɪznəs/',
    translation: 'бизнес; дело',
    example: 'She works in business.',
    exampleTranslation: 'Она работает в бизнесе.',
  ),
  Word(
    english: 'computer',
    transcription: '/kəmˈpjuːtə/',
    translation: 'компьютер',
    example: 'My computer is new.',
    exampleTranslation: 'Мой компьютер новый.',
  ),
  Word(
    english: 'project',
    transcription: '/ˈprɒdʒekt/',
    translation: 'проект',
    example: 'We started a new project.',
    exampleTranslation: 'Мы начали новый проект.',
  ),
  Word(
    english: 'give up',
    transcription: '/ɡɪv ʌp/',
    translation: 'сдаваться; бросать',
    example: 'Never give up.',
    exampleTranslation: 'Никогда не сдавайся.',
  ),
  Word(
    english: 'find out',
    transcription: '/faɪnd aʊt/',
    translation: 'выяснять; узнавать',
    example: 'I want to find out the truth.',
    exampleTranslation: 'Я хочу узнать правду.',
  ),
  Word(
    english: 'carry on',
    transcription: '/ˈkæri ɒn/',
    translation: 'продолжать',
    example: 'Please carry on working.',
    exampleTranslation: 'Пожалуйста, продолжай работать.',
  ),
];

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<Word> foundWords = words.where((word) {
      return word.english.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Английский словарь',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF694832),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Введите английское слово...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: searchQuery.isEmpty
                ? const Center(
              child: Text('Начните вводить слово для поиска'),
            )
                : foundWords.isEmpty
                ? const Center(
              child: Text('Слово не найдено'),
            )
                : ListView.builder(
              itemCount: foundWords.length,
              itemBuilder: (context, index) {
                final word = foundWords[index];

                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      word.english,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF694832),
                      ),
                    ),
                    subtitle: Text(
                      '${word.transcription}\n'
                          '${word.translation}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StudyScreen extends StatefulWidget {
  final List<Word> studyWords;

  const StudyScreen({
    super.key,
    this.studyWords = words,
  });

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int currentCardIndex = 0;
  bool showTranslation = false;
  int knownWords = 0;
  int unknownWords = 0;
  bool isStudyFinished = false;

  @override
  Widget build(BuildContext context) {
    final word = widget.studyWords[currentCardIndex];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Учебные карточки',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF694832),
                ),
              ),
              Text(
                '${currentCardIndex + 1}/${widget.studyWords.length}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF806D5D),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Text(
            'Знаю: $knownWords  •  Не знаю: $unknownWords',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF806D5D),
            ),
          ),

          const SizedBox(height: 24),
          Card(
            color: Colors.white,
            elevation: 3,
            child: SizedBox(
              width: double.infinity,
              height: 280,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      word.english,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF694832),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      word.transcription,
                      style: const TextStyle(fontSize: 18),
                    ),
                    if (showTranslation) ...[
                      const SizedBox(height: 20),
                      Text(
                        word.translation,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xFFE99A56),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        word.example,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        word.exampleTranslation,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showTranslation = !showTranslation;
                });
              },
              child: Text(
                showTranslation ? 'Скрыть перевод' : 'Показать перевод',
              ),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (isStudyFinished) return;

                    setState(() {
                      knownWords++;

                      if (currentCardIndex < widget.studyWords.length - 1) {
                        currentCardIndex++;
                        showTranslation = false;
                      } else {
                        isStudyFinished = true;
                      }
                    });
                  },
                  child: const Text('Знаю'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      unknownWords++;
                      currentCardIndex = (currentCardIndex + 1) % words.length;
                      showTranslation = false;
                    });
                  },
                  child: const Text('Не знаю'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Deck {
  final String name;
  final String description;
  final int wordCount;
  final IconData icon;
  final List<String> sampleWords;

  const Deck({
    required this.name,
    required this.description,
    required this.wordCount,
    required this.icon,
    required this.sampleWords,
  });
}


const List<Deck> decks = [
  Deck(
    name: 'Travel & Airport',
    description: 'Путешествия и аэропорт',
    wordCount: 64,
    icon: Icons.flight_rounded,
    sampleWords: ['travel', 'airport', 'ticket'],
  ),
  Deck(
    name: 'Business & Tech',
    description: 'Бизнес и IT-лексика',
    wordCount: 120,
    icon: Icons.work_rounded,
    sampleWords: ['business', 'computer', 'project'],
  ),
  Deck(
    name: 'Phrasal Verbs',
    description: 'Фразовые глаголы',
    wordCount: 180,
    icon: Icons.bolt_rounded,
    sampleWords: ['give up', 'find out', 'carry on'],
  ),
  Deck(
    name: 'Oxford 3000',
    description: 'Основная английская лексика',
    wordCount: 95,
    icon: Icons.school_rounded,
    sampleWords: ['beautiful', 'brave', 'love'],
  ),
];


class DecksScreen extends StatelessWidget {
  final void Function(List<Word>) onStartStudy;

  const DecksScreen({
    super.key,
    required this.onStartStudy,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: decks.length,
      itemBuilder: (context, index) {
        final deck = decks[index];


        return Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFFFE8D0),
              child: Icon(
                deck.icon,
                color: const Color(0xFFE99A56),
              ),
            ),
            title: Text(
              deck.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF694832),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '${deck.description}\n${deck.wordCount} слов',
              ),
            ),
            isThreeLine: true,
            trailing: const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF806D5D),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeckDetailScreen(
                    deck: deck,
                    onStartStudy: onStartStudy,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DeckDetailScreen extends StatelessWidget {
  final Deck deck;
  final void Function(List<Word>) onStartStudy;

  const DeckDetailScreen({
    super.key,
    required this.deck,
    required this.onStartStudy,
  });

  @override
  Widget build(BuildContext context) {
    final deckWords = words
        .where((word) => deck.sampleWords.contains(word.english))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(deck.name),
        backgroundColor: const Color(0xFFFFF9F2),
        foregroundColor: const Color(0xFF694832),
      ),
      backgroundColor: const Color(0xFFFFF9F2),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onStartStudy(deckWords);
                },
                child: const Text('Начать обучение'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              deck.description,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF806D5D),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Примеры слов: ${deck.sampleWords.length}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF694832),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: deckWords.length,
                itemBuilder: (context, index) {
                  final word = deckWords[index];

                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(
                        Icons.menu_book_rounded,
                        color: Color(0xFFE99A56),
                      ),
                      title: Text(word.english),
                      subtitle: Text(
                        '${word.transcription}\n${word.translation}',
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

