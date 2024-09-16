import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'favQuote.dart';
import 'randomqoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomQuoteGenerator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RandomQuoteGenerator extends StatelessWidget {
  const RandomQuoteGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuotePage();
  }
}

RandomQuote randomQuotes = RandomQuote();

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key})
      : super(
          key: key,
        );

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  void _shareQuote(
    String quote,
    String author,
  ) {
    Share.share(
      '$quote\n\n- $author',
    );
  }

  void _addToFavorites() {
    setState(() {
      randomQuotes.addToFavorites();

      randomQuotes.showToast(
        "Added to Favorites!",
      );
    });
  }

  void _refreshQuote() {
    setState(() {
      randomQuotes.nextQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quote Of The Day',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontSize: 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteQuotesPage(
                    randomQuotes: randomQuotes,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              _shareQuote(
                randomQuotes.getQuoteText(),
                randomQuotes.getQuoteAuthor(),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                randomQuotes.getQuoteText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Cursive',
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(
                        255,
                        2,
                        2,
                        2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                randomQuotes.getQuoteAuthor(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Satisfy',
                  color: Color.fromARGB(
                    255,
                    132,
                    49,
                    80,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _addToFavorites,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink.shade900,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
                child: const Text(
                  "Add to Favorites",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _refreshQuote,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink.shade700,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
                child: const Text(
                  "Refresh",
                  style: TextStyle(
                    fontSize: 20.0,
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
