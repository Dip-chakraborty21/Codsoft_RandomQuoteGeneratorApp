import 'package:flutter/material.dart';
import 'quote.dart';
import 'randomqoutes.dart';
import 'package:share/share.dart';

class FavoriteQuotesPage extends StatelessWidget {
  final RandomQuote randomQuotes;

  const FavoriteQuotesPage({required this.randomQuotes, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Quote> favoriteQuotes = randomQuotes.getFavoriteQuotes();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Quotes',
        ),
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
      ),
      body: favoriteQuotes.isEmpty
          ? const Center(
              child: Text(
                'No favorite quotes added yet!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(
                    136,
                    14,
                    79,
                    1,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteQuotes.length,
              itemBuilder: (context, index) {
                final quote = favoriteQuotes[index];
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quote.quote,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- ${quote.author}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(
                              255,
                              243,
                              68,
                              138,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            Share.share('${quote.quote} - ${quote.author}');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.pink.shade900,
                          ),
                          child: const Text("Share"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
